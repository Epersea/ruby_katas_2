require_relative '../boat'

RSpec.describe Boat do

  let(:boat) { Boat.new }
  let(:initial_possible_passengers) {['D', 'D', 'D', 'M', 'M', 'M']}

  it 'initiates with 3 passenger combinations and no current passengers' do
    
    expected_current_passengers = []
    expect(boat.possible_passengers).to eq(initial_possible_passengers)
    expect(boat.current_passengers).to eq(expected_current_passengers)
  end

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

  context 'when there is no passenger combinations left' do
    it 'current passengers are empty' do

      4.times { boat.select_passengers }

      expect(boat.current_passengers).to be_empty
    end

    it 'passenger combinations are restarted' do

      4.times { boat.select_passengers }

      expect(boat.possible_passengers).to eq(initial_possible_passengers)
    end

  end

end