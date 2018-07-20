require_relative('../db/sql_runner.rb')

class Merchant

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



  # Update



  # Delete



end
