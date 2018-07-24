require_relative('../db/sql_runner.rb')

class Transaction

  attr_writer :merchant_id, :category_id, :amount_spent, :entry_date
  attr_reader :id, :merchant_id, :category_id, :amount_spent, :entry_date

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @merchant_id = options['merchant_id'].to_i
    @category_id = options['category_id'].to_i
    @amount_spent = options['amount_spent'].to_i
    @entry_date = Date.parse(options['entry_date'])
  end

  # Create
  def save()
    sql = "INSERT INTO transactions (merchant_id, category_id, amount_spent, entry_date)
    VALUES ($1, $2  , $3, $4)
    RETURNING id;"
    values = [@merchant_id, @category_id, @amount_spent, @entry_date]
    result = SqlRunner.run(sql, values) # array of hash with id number.
    id_hash = result.first
    @id = id_hash['id'].to_i
  end

  # Read
  def self.find(id)
    sql = "SELECT * FROM transactions WHERE id = $1;"
    values = [id]
    result = SqlRunner.run(sql, values) # array of hash with transactions information.
    return Transaction.new(result.first) # creates Transaction object of found transactions.
  end

  #
  def self.unique_years(all_transactions)
    return all_transactions.map { |t| t.entry_date.year }.uniq
  end

  def self.all()
    sql = "SELECT * FROM transactions ORDER BY entry_date;"
    results = SqlRunner.run(sql) # array of transaction hashes.
    return results.map { |transaction_hash| Transaction.new(transaction_hash) } # array of Transaction objects.
  end

  # Method to bring back all transactions relating to a given month.
  def self.year_all(my_year)
    all_transactions = Transaction.all()
    year_transactions = []
    for transaction in all_transactions
      if transaction.entry_date.year == my_year
        year_transactions << transaction
      end
    end
    return year_transactions
  end

  # Method to bring back all transactions relating to a given month.
  def self.month_all(my_month, my_year)
    all_transactions = Transaction.all()
    month_transactions = []
    for transaction in all_transactions
      if transaction.entry_date.mon == my_month && transaction.entry_date.year == my_year.to_i
        month_transactions << transaction
      end
    end
    return month_transactions
  end

  # Update
  def update()
    sql = "UPDATE transactions
    SET (merchant_id, category_id, amount_spent, entry_date) = ($1, $2, $3, $4)
    WHERE id = $5;"
    values = [@merchant_id, @category_id, @amount_spent, @entry_date, @id]
    SqlRunner.run(sql, values)
  end

  # Delete
  def delete()
    sql = "DELETE FROM transactions WHERE id = $1;"
    values = [@id]
    SqlRunner.run(sql, values)
  end

  def self.delete_id(id)
    sql = "DELETE FROM transactions WHERE id = $1;"
    values = [id]
    SqlRunner.run(sql, values)
  end

  def self.delete_all
    sql = "DELETE FROM transactions;"
    SqlRunner.run(sql)
  end

  # Method to total up all of the transactions currently in the database.
  def self.total_all
    all_transactions = Transaction.all()
    total_amount_spent = 0
    for transaction in all_transactions
      amount = transaction.amount_spent.to_i
      total_amount_spent += amount
    end
    return total_amount_spent
  end

  def self.total_year(my_year)
    year_transactions = Transaction.year_all(my_year)
    year_amount_spent = 0
    for transaction in year_transactions
      amount = transaction.amount_spent.to_i
      year_amount_spent += amount
    end
    return year_amount_spent
  end

  def self.total_month(my_month, my_year)
    month_transactions = Transaction.month_all(my_month, my_year)
    month_amount_spent = 0
    for transaction in month_transactions
      amount = transaction.amount_spent.to_i
      month_amount_spent += amount
    end
    return month_amount_spent
  end

end
