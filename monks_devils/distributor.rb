require_relative 'state'

class Distributor
  attr_reader :states_to_try, :current_state

  def initialize
    @initial_state = State.new
    @current_state = {}
    @states_to_try = [@initial_state]
    @boat = Boat.new
  end

  def initiate_trip
    obtain_current_state

    select_boat_passengers

    calculate_new_state
    
  end

  def obtain_current_state
    @current_state = @states_to_try.pop
  end

  def select_boat_passengers
    @boat.select_passengers

    if @boat.current_passengers.empty?
      initiate_trip
    end
  end

  def calculate_new_state
    delete_passengers_from_shore_1
    add_passengers_to_shore_2
  end

  def delete_passengers_from_shore_1
    @boat.current_passengers.each do |passenger|
      if @current_state.shore_1.include?(passenger)
        @current_state.shore_1.delete_at(@current_state.shore_1.index(passenger))
      end
    end
  end

  def add_passengers_to_shore_2
    @boat.current_passengers.each do |passenger|
      @current_state.shore_2.push(passenger)
    end
  end
end