require('sinatra')
require('sinatra/contrib/all')
require_relative('../models/budget')
also_reload('../models/*')

# Index Budgets
get '/budgets/?' do
  erb(:"budgets/index")
end

# Budgets by Year
get '/budgets/year/:year' do
  @all_year_budgets = Budget.all_year(params['year'])
  @total_year_budget = Budget.total_year(params['year'])
  @year = params['year']
  erb(:"budgets/index_by_year")
end

# Show Budget
get '/budgets/:id/?' do
  @specified_budget = Budget.find(params['id'].to_i)
  erb(:"budgets/show")
end

# Edit Budget
get '/budgets/:id/edit/?' do
  @specified_budget = Budget.find(params['id'].to_i)
  erb(:"budgets/edit")
end

# Update Budget
post '/budgets/:id/?' do
  changing_budget = Budget.new(params)
  changing_budget.update()
  redirect to '/budgets/'
end
