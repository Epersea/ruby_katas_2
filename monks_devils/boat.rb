class Boat
  attr_reader :possible_passengers, :current_passengers

  def initialize
    @possible_passengers = initial_possible_passengers
    @current_passengers = []
  end

  def select_passengers
    if @possible_passengers.empty?
      @current_passengers = []
      @possible_passengers = initial_possible_passengers
    else
      @current_passengers = @possible_passengers.pop(2)
    end
  end

  def initial_possible_passengers
    ['D', 'D', 'D', 'M', 'M', 'M']
  end
end