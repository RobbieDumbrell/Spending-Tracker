require_relative('../db/sql_runner.rb')

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

end
