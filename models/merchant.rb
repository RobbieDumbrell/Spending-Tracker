require_relative('../db/sql_runner.rb')
require_relative('transaction')
require_relative('category')

class Merchant

  attr_writer :name
  attr_reader :id, :name

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @name = options['name']
  end

  # Create
  def save()
    sql = "INSERT INTO merchants (name)
          VALUES ($1)
          RETURNING id;"
    values = [@name]
    result = SqlRunner.run(sql, values) # array of hash with id number.
    id_hash = result.first
    @id = id_hash['id'].to_i
  end

  # Read
  def self.find(id)
    sql = "SELECT * FROM merchants WHERE id = $1;"
    values = [id]
    result = SqlRunner.run(sql, values) # array of hash with merchant information.
    return Merchant.new(result.first) # creates Merchant object of found merchant.
  end

  def self.all()
    sql = "SELECT * FROM merchants;"
    results = SqlRunner.run(sql) # array of merchant hashes.
    return results.map { |merchant_hash| Merchant.new(merchant_hash) } # array of Merchant objects.
  end

  # Update
  def update()
    sql = "UPDATE merchants
          SET name = $1
          WHERE id = $2;"
    values = [@name, @id]
    SqlRunner.run(sql, values)
  end

  # Delete
  def delete()
    sql = "DELETE FROM merchants WHERE id = $1;"
    values = [@id]
    SqlRunner.run(sql, values)
  end

  def self.delete_id(id)
    sql = "DELETE FROM merchants WHERE id = $1;"
    values = [id]
    SqlRunner.run(sql, values)
  end

  def self.delete_all
    sql = "DELETE FROM merchants;"
    SqlRunner.run(sql)
  end

  # Method to bring back all transactions associated with that merchant.
  def all_transactions()
    sql = "SELECT transactions.* FROM transactions
          INNER JOIN merchants
	          ON transactions.merchant_id = merchants.id
          WHERE transactions.merchant_id = $1;"
    values = [@id]
    results = SqlRunner.run(sql, values) # array of transaction hashes.
    return results.map { |transaction_hash| Transaction.new(transaction_hash) }
  end

  # Method to bring back all category types associated with that merchant (based on previously inputted transactions)
  def all_categories()
    sql = "SELECT categories.* FROM categories
          INNER JOIN transactions
	         ON categories.id = transactions.category_id
          INNER JOIN merchants
	         ON transactions.merchant_id = merchants.id
          WHERE merchants.id = $1;"
    values = [@id]
    results = SqlRunner.run(sql, values)
    all_categories = results.map { |category_hash| Category.new(category_hash) }
    category_type = all_categories.map { |category| category.type }
    return category_type.uniq
  end

end
