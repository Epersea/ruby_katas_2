class StatementPrinter
  def print(transactions)
    puts "Date || Amount || Balance\n"
    transactions.each do |transaction|
      puts "#{transaction[:date]} || #{transaction[:amount]} || #{transaction[:balance]}\n"
    end
  end
end