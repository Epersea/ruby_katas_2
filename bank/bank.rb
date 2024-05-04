require 'timecop'

class Bank
  def initialize
    @balance = 0
    @transactions = []
  end

  def balance
    @balance
  end

  def deposit(amount)
    @balance += amount
    record_transaction(amount)
  end

  def transactions
    @transactions
  end

  def print_statement
    statement = "Date || Amount || Balance\n"
    @transactions.each do |transaction|
      statement += "#{transaction[0].strftime("%d/%m/%Y")} || #{transaction[1]} || #{transaction[2]}\n"
    end

    statement
  end

  private
    def record_transaction(amount)
      @transactions.unshift([Date.today, amount, balance])
    end
end