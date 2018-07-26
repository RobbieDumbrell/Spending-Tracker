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

  months = Date::MONTHNAMES

  @months_info = []

  months.each { |month|
    next if month == nil
    month_number = months.index(month)
    month_spend = Transaction.total_month(month_number, params['year'].to_i)
    month_bud = Budget.find_year_month(params['year'], month_number).budget
    month_diff = month_bud - month_spend
     @months_info << {
       'month_name' => month,
       'month_spend' => month_spend,
       'month_bud' => month_bud,
       'month_diff' => month_diff
    }
  }
  erb(:overview)
end
