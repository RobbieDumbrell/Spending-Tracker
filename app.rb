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

  @jandiff = (@janbud.budget) - (@jan_spend)
  @febdiff = (@febbud.budget) - (@feb_spend)
  @mardiff = (@marbud.budget) - (@mar_spend)
  @aprdiff = (@aprbud.budget) - (@apr_spend)
  @maydiff = (@maybud.budget) - (@may_spend)
  @jundiff = (@junbud.budget) - (@jun_spend)
  @juldiff = (@julbud.budget) - (@jul_spend)
  @augdiff = (@augbud.budget) - (@aug_spend)
  @sepdiff = (@sepbud.budget) - (@sep_spend)
  @octdiff = (@octbud.budget) - (@oct_spend)
  @novdiff = (@novbud.budget) - (@nov_spend)
  @decdiff = (@decbud.budget) - (@dec_spend)



  erb(:overview)
end
