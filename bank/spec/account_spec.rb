require 'timecop'
require_relative '../account'
require_relative '../transaction_repository'
require_relative '../statement_printer'

RSpec.describe Account do

  let(:transaction_repository) { TransactionRepository.new}
  let(:statement_printer) { StatementPrinter.new}
  let(:account) { AccountHelper.new(transaction_repository, statement_printer) }

  context 'Acceptance test' do
    it 'implements desired behaviour' do

      Timecop.freeze(2012, 1, 10)
      account.deposit(1000)

      Timecop.freeze(2012, 1, 13)
      account.deposit(2000)

      Timecop.freeze(2012, 1, 14)
      account.withdraw(500)

      expect { account.print_statement }.to output(expected_statement).to_stdout
    end

    def expected_statement
      "Date || Amount || Balance\n14/01/2012 || -500 || 2500\n13/01/2012 || 2000 || 3000\n10/01/2012 || 1000 || 1000\n"
    end
  end

  context 'Unit tests' do
    
    context 'After a deposit' do
      it 'balance goes up' do
        account.deposit(1000)
        expected_balance = 1000
        expect(account.balance).to eq(expected_balance)
      end

      it 'transaction repository is called to add the transaction' do
        expect(transaction_repository).to receive(:add_deposit_transaction).with(1000, 1000)
        account.deposit(1000)
      end
    end

    context 'After a withdrawal' do

      it 'balance goes down' do
        account.withdraw(500)
        expected_balance = -500
        expect(account.balance).to eq(expected_balance)
      end

      it 'transaction repository is called to add the transaction' do
        expect(transaction_repository).to receive(:add_withdrawal_transaction).with(500, -500)
        account.withdraw(500)
      end
    end

    it 'When printing a statement, it gets all transactions all calls the printer' do
  
      expect(transaction_repository).to receive(:transactions)
      expect(statement_printer).to receive(:print)
      account.print_statement
    end
  end


  class AccountHelper < Account
    def balance
      @balance
    end
  end
end