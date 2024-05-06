require 'timecop'

class Account
  def initialize(repository, printer)
    @balance = 0
    @repository = repository
    @printer = printer
  end

  def deposit(amount)
    @balance += amount
    @repository.add_deposit_transaction(amount, @balance)
  end

  def withdraw(amount)
    @balance -= amount
    @repository.add_withdrawal_transaction(amount, @balance)
  end

  def print_statement
    transactions = @repository.transactions
    @printer.print(transactions)
  end
end