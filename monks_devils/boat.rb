class Boat
  attr_reader :passenger_combinations, :current_passengers

  def initialize
    @passenger_combinations = ['DD', 'MD', 'MM']
    @current_passengers = []
  end

  def select_passengers
    @current_passengers = []
    @current_passengers << @passenger_combinations.pop
  end
end