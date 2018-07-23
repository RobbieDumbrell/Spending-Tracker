require('sinatra')
require('sinatra/contrib/all')
require_relative('controllers/merchants_controller')
require_relative('controllers/categories_controller')
require_relative('controllers/transactions_controller')
require_relative('controllers/budgets_controller')

get '/?' do
  erb(:index)
end

get '/overviews/:year/?' do
  @year = params['year'].to_i
  # @jan_spend = Transaction.total_month(1)
  # @feb_spend = Transaction.total_month(2)
  # @mar_spend = Transaction.total_month(3)
  # @apr_spend = Transaction.total_month(4)
  # @may_spend = Transaction.total_month(5)
  # @jun_spend = Transaction.total_month(6)
  # @jul_spend = Transaction.total_month(7)
  # @aug_spend = Transaction.total_month(8)
  # @sep_spend = Transaction.total_month(9)
  # @oct_spend = Transaction.total_month(10)
  # @nov_spend = Transaction.total_month(11)
  # @dec_spend = Transaction.total_month(12)
  # @jan_bud =

  erb(:overview)
end
