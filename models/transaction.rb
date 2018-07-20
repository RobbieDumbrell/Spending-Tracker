require_relative('../db/sql_runner.rb')

class Transaction

  attr_reader :id, :merchant_id, :category_id, :amount_spent

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @merchant_id = options['merchant_id'].to_i
    @category_id = options['category_id'].to_i
    @amount_spent = options['amount_spent'].to_i
  end

end
