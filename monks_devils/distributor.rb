require_relative 'state'
require_relative 'boat'

class Distributor
  attr_reader :states_to_try, :current_state

  def initialize
    @initial_state = State.new
    @current_state = {}
    @states_to_try = [@initial_state]
  end

  def initiate_trip
    solution_found = false
    while !@states_to_try.empty? && !solution_found
      p "States to try at the beginning of the first loop"
      p @states_to_try
      obtain_current_state
      p "Current state at the beginning"
      p @current_state
      possible_passengers = @current_state.shore_1.clone
      boat = Boat.new(possible_passengers)

      while !boat.possible_passengers.empty?
        boat.select_passengers
       
        temporal_state = calculate_new_state(boat) 
        p "Temporal state after selecting passengers"
        p temporal_state
        validation = temporal_state.validate
        p validation
        if validation == 'FINISHED'
          #temporal_state.trips << boat.current_passengers
          solution_found = true
          break
        elsif validation == 'VALID'
          #temporal_state.trips << boat.current_passengers
          @states_to_try << temporal_state
          break
        end
      end
    end

    return temporal_state.trips
  end

  def obtain_current_state
    @current_state = @states_to_try.pop
  end

  def select_boat_passengers
    if @current_state.shore_1.empty?
      initiate_trip
    else
      @boat = Boat.new(@current_state.shore_1)
      @boat.select_passengers
      calculate_new_state
      validate_new_state
    end
  end

  def calculate_new_state(boat)
    shore_1 = delete_passengers_from_shore_1(boat)
    shore_2 = add_passengers_to_shore_2(boat)
    trips = add_current_trip(boat)
    State.new(shore_1, shore_2, trips)
  end

  def delete_passengers_from_shore_1(boat)
    current_shore_1 = @current_state.shore_1.clone
    # p "Shore 1 before delete"
    # p current_shore_1
    
    boat.current_passengers.each do |passenger|
      if current_shore_1.include?(passenger)
        index = current_shore_1.index(passenger)
        current_shore_1.delete_at(index)
      end
    end
    # p "Shore 1 after delete"
    # p current_shore_1
    current_shore_1
  end

  def add_passengers_to_shore_2(boat)
    current_shore_2 = @current_state.shore_2.clone
    # p "Shore 2 before push"
    # p current_shore_2
    boat.current_passengers.each do |passenger|
      current_shore_2.push(passenger)
    end
    # p "Shore 2 after push"
    # p current_shore_2
    current_shore_2
  end

  def add_current_trip(boat)
    current_trips = @current_state.trips.clone
    current_trips << boat.current_passengers
    current_trips
  end

  def validate_new_state
    validation = @current_state.validate

    if validation == 'FINISHED'
      @current_state.trips << @boat.current_passengers
     
    end

    if validation == 'VALID'
      @current_state.trips << @boat.current_passengers
      @states_to_try << @current_state
      initiate_trip
    end

    if validation == 'INVALID'
    
      select_boat_passengers
    end
  end
end