class Boat
  attr_reader :passenger_combinations, :current_passengers

  def initialize
    @passenger_combinations = initial_passenger_combinations
    @current_passengers = []
  end

  def select_passengers
    @current_passengers = []
    if @passenger_combinations.empty?
      @passenger_combinations = initial_passenger_combinations
    else
      @current_passengers << @passenger_combinations.pop
    end
  end

  def initial_passenger_combinations
    ['DD', 'MD', 'MM']
  end
end