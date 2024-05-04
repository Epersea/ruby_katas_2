require 'timecop'
require_relative '../account'

RSpec.describe Account do

  context 'Acceptance test' do
    it 'implements desired behaviour' do
      account = Account.new

      Timecop.freeze(2012, 1, 10)
      account.deposit(1000)

      Timecop.freeze(2012, 1, 13)
      account.deposit(2000)

      Timecop.freeze(2012, 1, 14)
      account.withdraw(500)

      statement = account.print_statement
      expect(statement.strip).to eq(expected_statement.strip)
    end

    def expected_statement
      "Date || Amount || Balance\n14/01/2012 || -500 || 2500\n13/01/2012 || 2000 || 3000\n10/01/2012 || 1000 || 1000"
    end
  end

  context 'Unit tests' do
    let(:account) { AccountHelper.new }
    context 'After a deposit' do
      before(:each) do
        Timecop.freeze(2012, 1, 10)
        account.deposit(1000)
      end

      it 'balance goes up' do
        expected_balance = 1000
        expect(account.balance).to eq(expected_balance)
      end

      it 'transaction is recorded' do
        expect(account.transactions).to eq([{:amount=>1000, :balance=>1000, :date=>"10/01/2012"}])
      end
    end
  end


  class AccountHelper < Account
    def balance
      @balance
    end

    def transactions
      @transactions
    end
  end
end