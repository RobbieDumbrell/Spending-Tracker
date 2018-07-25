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

  @jan_spend = Transaction.total_month(1, params['year'])
  @feb_spend = Transaction.total_month(2, params['year'])
  @mar_spend = Transaction.total_month(3, params['year'])
  @apr_spend = Transaction.total_month(4, params['year'])
  @may_spend = Transaction.total_month(5, params['year'])
  @jun_spend = Transaction.total_month(6, params['year'])
  @jul_spend = Transaction.total_month(7, params['year'])
  @aug_spend = Transaction.total_month(8, params['year'])
  @sep_spend = Transaction.total_month(9, params['year'])
  @oct_spend = Transaction.total_month(10, params['year'])
  @nov_spend = Transaction.total_month(11, params['year'])
  @dec_spend = Transaction.total_month(12, params['year'])

  @janbud = Budget.find_year_month(params['year'], 1)
  @febbud = Budget.find_year_month(params['year'], 2)
  @marbud = Budget.find_year_month(params['year'], 3)
  @aprbud = Budget.find_year_month(params['year'], 4)
  @maybud = Budget.find_year_month(params['year'], 5)
  @junbud = Budget.find_year_month(params['year'], 6)
  @julbud = Budget.find_year_month(params['year'], 7)
  @augbud = Budget.find_year_month(params['year'], 8)
  @sepbud = Budget.find_year_month(params['year'], 9)
  @octbud = Budget.find_year_month(params['year'], 10)
  @novbud = Budget.find_year_month(params['year'], 11)
  @decbud = Budget.find_year_month(params['year'], 12)

  @jandiff = (@janbud.budget.to_i) - (@jan_spend.to_i)
  @febdiff = (@febbud.budget.to_i) - (@feb_spend.to_i)
  @mardiff = (@marbud.budget.to_i) - (@mar_spend.to_i)
  @aprdiff = (@aprbud.budget.to_i) - (@apr_spend.to_i)
  @maydiff = (@maybud.budget.to_i) - (@may_spend.to_i)
  @jundiff = (@junbud.budget.to_i) - (@jun_spend.to_i)
  @juldiff = (@julbud.budget.to_i) - (@jul_spend.to_i)
  @augdiff = (@augbud.budget.to_i) - (@aug_spend.to_i)
  @sepdiff = (@sepbud.budget.to_i) - (@sep_spend.to_i)
  @octdiff = (@octbud.budget.to_i) - (@oct_spend.to_i)
  @novdiff = (@novbud.budget.to_i) - (@nov_spend.to_i)
  @decdiff = (@decbud.budget.to_i) - (@dec_spend.to_i)



  erb(:overview)
end
