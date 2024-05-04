require 'timecop'
require_relative '../bank'

RSpec.describe Bank do

  let(:bank) { Bank.new }

  context 'Acceptance test' do
    it 'implements desired behaviour' do
      
      Timecop.freeze(2012, 1, 10)
      bank.deposit(1000)

      Timecop.freeze(2012, 1, 13)
      bank.deposit(2000)

      # Timecop.freeze(2012, 1, 14)
      # bank.withdraw(500)

      statement = bank.print_statement
      expect(statement).to eq(expected_statement)
    end

    def expected_statement
      "Date || Amount || Balance
      14/01/2012 || -500 || 2500
      13/01/2012 || 2000 || 3000
      10/01/2012 || 1000 || 1000"
    end
  end

  context 'Unit tests' do
    context 'After a deposit' do
      before(:each) do
        Timecop.freeze(2012, 1, 10)
        bank.deposit(1000)
      end

      it 'balance goes up' do
        expected_balance = 1000
        expect(bank.balance).to eq(expected_balance)
      end

      it 'transaction is recorded' do
        expect(bank.transactions).to eq([[Date.new(2012, 1, 10), 1000, 1000]])
      end
    end
  end
end