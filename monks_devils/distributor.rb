require_relative 'state'

class Distributor
  attr_reader :states_to_try, :current_state

  def initialize
    @initial_state = State.new
    @current_state = {}
    @states_to_try = [@initial_state]
  end

  def initiate_trip
    @current_state = @states_to_try.pop
  end
end