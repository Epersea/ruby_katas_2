class Boat
  attr_reader :possible_passengers, :current_passengers

  def initialize
    @possible_passengers = all_passengers
    @current_passengers = []
  end

  def select_passengers
    if @possible_passengers.empty?
      @current_passengers = []
      @possible_passengers = all_passengers
    else
      @current_passengers = @possible_passengers.pop(2)
    end
  end

  def all_passengers
    ['D', 'D', 'D', 'M', 'M', 'M']
  end
end