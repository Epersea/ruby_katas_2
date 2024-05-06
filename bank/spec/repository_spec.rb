require 'timecop'
require_relative '../transaction_repository'

RSpec.describe TransactionRepository do

  let(:transaction_repository) { TransactionRepository.new}

  before(:each) do
    Timecop.freeze(2022, 1, 1)
  end

  it 'records a deposit transaction' do

    transaction_repository.add_deposit_transaction(1000, 1000)
    
    expect(transaction_repository.transactions.size).to eq(1)
    expect(transaction_repository.transactions[0]).to eq(deposit_transaction)
  end

  it 'records a withdrawal transaction' do

    transaction_repository.add_withdrawal_transaction(500, -500)
    
    expect(transaction_repository.transactions.size).to eq(1)
    expect(transaction_repository.transactions[0]).to eq(withdrawal_transaction)
  end

  it 'stores all transactions in reverse order' do
    transaction_repository.add_deposit_transaction(1000, 1000)
    transaction_repository.add_withdrawal_transaction(500, -500)
    
    expect(transaction_repository.transactions.size).to eq(2)
    expect(transaction_repository.transactions[0]).to eq(withdrawal_transaction)
    expect(transaction_repository.transactions[1]).to eq(deposit_transaction)
  end

  def deposit_transaction
    {date: Date.new(2022, 1, 1).strftime("%d/%m/%Y"),
      amount: 1000,
      balance: 1000}
  end

  def withdrawal_transaction
    {date: Date.new(2022, 1, 1).strftime("%d/%m/%Y"),
      amount: -500,
      balance: -500}
  end
end
