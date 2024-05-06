class TransactionRepository

  def initialize
    @transactions = []
  end

  def add_deposit_transaction(amount, balance)
    @transactions.unshift({
      date: Date.today.strftime("%d/%m/%Y"),
      amount: amount,
      balance: balance
    })
  end

  def add_withdrawal_transaction(amount, balance)
    @transactions.unshift({
      date: Date.today.strftime("%d/%m/%Y"),
      amount: -amount,
      balance: balance
    })
  end

  def transactions
    @transactions
  end
end