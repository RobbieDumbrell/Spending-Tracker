require_relative('../db/sql_runner.rb')

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


end
