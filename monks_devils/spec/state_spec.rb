require_relative '../state'

RSpec.describe State do

  it 'returns invalid if there are more devils than monks on shore 1' do
    state = State.new(['D', 'D', 'M'], ['M', 'M', 'D'])

    validation = state.validate

    expect(validation).to eq('INVALID')
  end

  it 'returns invalid if there are more devils than monks on shore 2' do
    state = State.new(['D', 'M', 'M'], ['M', 'D', 'D'])

    validation = state.validate

    expect(validation).to eq('INVALID')
  end

  it 'returns valid if there are no more devils than monks in either shore' do
    state = State.new(['D', 'M'], ['M', 'M' 'D', 'D'])

    validation = state.validate

    expect(validation).to eq('VALID')
  end

  it 'returns valid if there are only devils in one shore and more monks than devils in the other' do
    state = State.new(['D', 'D'], ['M', 'M' 'M', 'D'])

    validation = state.validate

    expect(validation).to eq('VALID')
  end

  it 'returns finished if all passengers are in shore 2' do
    state = State.new([], ['D', 'M', 'D', 'M', 'D', 'M'])

    validation = state.validate

    expect(validation).to eq('FINISHED')
  end
end