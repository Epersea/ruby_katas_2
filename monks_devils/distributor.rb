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
    
    unless @boat.current_passengers.empty?
      calculate_new_state
    end

  end

  def obtain_current_state
    @current_state = @states_to_try.pop
  end

  def select_boat_passengers
    @boat.select_passengers
  end

  def calculate_new_state

  end
end