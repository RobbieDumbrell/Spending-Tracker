require_relative('../db/sql_runner.rb')

class Budget

  attr_writer :budget
  attr_reader :id, :month, :budget

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @month = options['month']
    @budget = options['budget'].to_i
  end

  # Create
  def save()
    sql = "INSERT INTO budgets (month, budget)
    VALUES ($1, $2)
    RETURNING id;"
    values = [@month, @budget]
    result = SqlRunner.run(sql, values) # array of hash with id number.
    id_hash = result.first
    @id = id_hash['id'].to_i
  end

  # Read
  def self.find(id)
    sql = "SELECT * FROM budgets WHERE id = $1;"
    values = [id]
    result = SqlRunner.run(sql, values) # array of hash with budget information.
    return Budget.new(result.first) # creates Budget object of found budget.
  end

  def self.all()
    sql = "SELECT * FROM budgets;"
    results = SqlRunner.run(sql) # array of budget hashes.
    return results.map { |budget_hash| Budget.new(budget_hash) } # array of Budget objects.
  end

  # Update - will only ever be allowed to update values, not month names (these are set).
  def update()
    sql = "UPDATE budgets
    SET budget = $1
    WHERE id = $2;"
    values = [@budget, @id]
    SqlRunner.run(sql, values)
  end

  # Will never delete a budget month so don't need delete functions.

  

end
