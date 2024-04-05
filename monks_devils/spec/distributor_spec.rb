require_relative '../distributor'
require_relative '../state'

RSpec.describe Distributor do
  it 'pops state to check and adds it to current state' do
    distributor = Distributor.new
    expect(distributor.states_to_try).not_to be_empty
    expect(distributor.current_state).to be_empty
    
    distributor.initiate_trip 
    
    expect(distributor.current_state.shore_1).to eq(initial_shore_1)
    expect(distributor.current_state.shore_2).to be_empty
    expect(distributor.current_state.trips).to be_empty
    expect(distributor.states_to_try).to be_empty
  end

  def initial_shore_1
    ["D", "D", "D", "M", "M", "M"]
  end
end