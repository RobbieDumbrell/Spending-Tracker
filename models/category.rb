require_relative('../db/sql_runner.rb')
require_relative('transaction')
require_relative('merchant')

class Category

  attr_writer :type
  attr_reader :id, :type

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @type = options['type']
  end

  # Create
  def save()
    sql = "INSERT INTO categories (type)
    VALUES ($1)
    RETURNING id;"
    values = [@type]
    result = SqlRunner.run(sql, values) # array of hash with id number.
    id_hash = result.first
    @id = id_hash['id'].to_i
  end

  # Read
  def self.find(id)
    sql = "SELECT * FROM categories WHERE id = $1;"
    values = [id]
    result = SqlRunner.run(sql, values) # array of hash with category information.
    return Category.new(result.first) # creates Category object of found category.
  end

  def self.all()
    sql = "SELECT * FROM categories;"
    results = SqlRunner.run(sql) # array of category hashes.
    return results.map { |category_hash| Category.new(category_hash) } # array of Category objects.
  end

  # Update
  def update()
    sql = "UPDATE categories
    SET type = $1
    WHERE id = $2;"
    values = [@type, @id]
    SqlRunner.run(sql, values)
  end

  # Delete
  def delete()
    sql = "DELETE FROM categories WHERE id = $1;"
    values = [@id]
    SqlRunner.run(sql, values)
  end

  def self.delete_id(id)
    sql = "DELETE FROM categories WHERE id = $1;"
    values = [id]
    SqlRunner.run(sql, values)
  end

  def self.delete_all
    sql = "DELETE FROM categories;"
    SqlRunner.run(sql)
  end

  # Method to bring back all transactions associated with that category.
  def all_transactions()
    sql = "SELECT transactions.* FROM transactions
    INNER JOIN categories
    ON transactions.category_id = categories.id
    WHERE transactions.category_id = $1
    ORDER BY entry_date;"
    values = [@id]
    results = SqlRunner.run(sql, values) # array of transaction hashes.
    return results.map { |transaction_hash| Transaction.new(transaction_hash) }
  end

  def all_merchants()
    sql = "SELECT merchants.* FROM merchants
    INNER JOIN transactions
    ON merchants.id = transactions.merchant_id
    INNER JOIN categories
    ON transactions.category_id = categories.id
    WHERE categories.id = $1;"
    values = [@id]
    results = SqlRunner.run(sql, values)
    all_merchants = results.map { |merchant_hash| Merchant.new(merchant_hash) }
    return all_merchants
  end


end
