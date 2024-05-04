require 'timecop'

class Bank
  def initialize
    @balance = 0
    @transactions = []
  end

  def deposit(amount)
    @balance += amount
    record_transaction(amount)
  end

  def print_statement
    statement = "Date || Amount || Balance\n"
    @transactions.each do |transaction|
      statement += "#{transaction[:date]} || #{transaction[:amount]} || #{transaction[:balance]}\n"
    end

    statement
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