require 'timecop'

class Account
  def initialize(repository)
    @balance = 0
    @repository = repository
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
    puts "Date || Amount || Balance\n"
    @transactions.each do |transaction|
      puts "#{transaction[:date]} || #{transaction[:amount]} || #{transaction[:balance]}\n"
    end
  end
end