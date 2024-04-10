require_relative '../boat'

RSpec.describe Boat do

  let(:all_passengers) {['D', 'D', 'D', 'M', 'M', 'M']}
  let(:boat) { Boat.new(all_passengers) }

  it 'selects two monks first' do

    boat.select_passengers

    expected_possible_passengers = ['D', 'D', 'D', 'M']
    expected_current_passengers = ['M', 'M']
    expect(boat.possible_passengers).to eq(expected_possible_passengers)
    expect(boat.current_passengers).to eq(expected_current_passengers)
  end

  it 'selects one devil and one monk second' do

    2.times { boat.select_passengers }

    expected_possible_passengers = ['D', 'D']
    expected_current_passengers = ['D', 'M']
    expect(boat.possible_passengers).to eq(expected_possible_passengers)
    expect(boat.current_passengers).to eq(expected_current_passengers)
  end

  it 'selects two devils last' do

    3.times { boat.select_passengers }

    expected_possible_passengers = []
    expected_current_passengers = ['D', 'D']
    expect(boat.possible_passengers).to eq(expected_possible_passengers)
    expect(boat.current_passengers).to eq(expected_current_passengers)
  end
end