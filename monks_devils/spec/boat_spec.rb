require_relative '../boat'

RSpec.describe Boat do

  let(:boat) { Boat.new }

  it 'initiates with 3 passenger combinations and no current passengers' do
    
    expected_passenger_combinations = ['DD', 'MD', 'MM']
    expected_current_passengers = []
    expect(boat.passenger_combinations).to eq(expected_passenger_combinations)
    expect(boat.current_passengers).to eq(expected_current_passengers)
  end

  it 'selects two monks first' do

    boat.select_passengers

    expected_passenger_combinations = ['DD', 'MD']
    expected_current_passengers = ['MM']
    expect(boat.passenger_combinations).to eq(expected_passenger_combinations)
    expect(boat.current_passengers).to eq(expected_current_passengers)
  end

  it 'selects one monk and one devil second' do

    2.times { boat.select_passengers }

    expected_passenger_combinations = ['DD']
    expected_current_passengers = ['MD']
    expect(boat.passenger_combinations).to eq(expected_passenger_combinations)
    expect(boat.current_passengers).to eq(expected_current_passengers)
  end

  it 'selects two devils last' do

    3.times { boat.select_passengers }

    expected_passenger_combinations = []
    expected_current_passengers = ['DD']
    expect(boat.passenger_combinations).to eq(expected_passenger_combinations)
    expect(boat.current_passengers).to eq(expected_current_passengers)
  end


end