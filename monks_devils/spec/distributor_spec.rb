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

  it 'if boat has passengers, calls to calculate new state' do
    allow(distributor).to receive(:calculate_new_state).and_call_original

    distributor.initiate_trip

    expect(distributor).to have_received(:calculate_new_state)
  end

  it 'if boat has no passengers, calls initiate trip' do
    allow(distributor).to receive(:initiate_trip).and_call_original

    4.times {distributor.select_boat_passengers}

    expect(distributor).to have_received(:initiate_trip)
  end

  it 'calculates new state' do
    distributor.obtain_current_state
    distributor.select_boat_passengers

    distributor.calculate_new_state

    expect(distributor.current_state.shore_1).to eq(shore_1_after_first_trip)
    expect(distributor.current_state.shore_2).to eq(shore_2_after_first_trip)
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
end