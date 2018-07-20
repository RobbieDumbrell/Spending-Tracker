require_relative('../db/sql_runner.rb')

class Category

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



  # Update



  # Delete



end
