class Boat
  attr_reader :possible_passengers, :current_passengers

  def initialize(possible_passengers)
    @possible_passengers = possible_passengers
    @current_passengers = []
  end

  def select_passengers
    @current_passengers = @possible_passengers.pop(2)
  end
end