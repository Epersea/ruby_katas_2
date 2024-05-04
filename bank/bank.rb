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

  end

  private
    def record_transaction(amount)
      @transactions << [Date.today, amount, balance]
    end
end