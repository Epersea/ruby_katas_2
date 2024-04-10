require_relative '../distributor'
require_relative '../state'

RSpec.describe Distributor do
  let(:distributor) { Distributor.new }

  it 'obtains current state' do
    expect(distributor.states_to_try).not_to be_empty
    expect(distributor.current_state).to be_empty
    
    distributor.obtain_current_state
    
    expect(distributor.current_state.shore_1).to eq(initial_shore_1)
    expect(distributor.current_state.shore_2).to be_empty
    expect(distributor.current_state.trips).to be_empty
    expect(distributor.states_to_try).to be_empty
  end

  it 'calculates new state' do
    distributor.obtain_current_state
    boat = Boat.new(initial_shore_1)
    boat.select_passengers

    new_state = distributor.calculate_new_state(boat)

    expect(new_state.shore_1).to eq(shore_1_after_first_trip)
    expect(new_state.shore_2).to eq(shore_2_after_first_trip)
    expect(new_state.trips).to eq(trips_after_first_trip)
  end

  it 'finds correct solution' do
    result = distributor.initiate_trip

    expect(result).to eq([['D', 'M'], ['M', 'M'], ['D', 'D']])
  end

  def initial_shore_1
    ["D", "D", "D", "M", "M", "M"]
  end

  def shore_1_after_first_trip
    ["D", "D", "D", "M"]
  end

  def shore_2_after_first_trip
    ["M", "M"]
  end

  def trips_after_first_trip
    [["M", "M"]]
  end
end