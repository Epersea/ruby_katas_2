require 'timecop'

class Account
  def initialize
    @balance = 0
    @transactions = []
  end

  def deposit(amount)
    @balance += amount
    record_transaction(amount)
  end

  def withdraw(amount)
    @balance -= amount
    record_transaction(-amount)
  end

  def print_statement
    puts "Date || Amount || Balance\n"
    @transactions.each do |transaction|
      puts "#{transaction[:date]} || #{transaction[:amount]} || #{transaction[:balance]}\n"
    end
  end

  private
    def record_transaction(amount)
      @transactions.unshift({
        date: Date.today.strftime("%d/%m/%Y"),
        amount: amount,
        balance: @balance
      })
    end
end