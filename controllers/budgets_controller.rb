require('sinatra')
require('sinatra/contrib/all')
require_relative('../models/budget')
also_reload('../models/*')

# Index Budgets
get '/budgets/?' do
  @all_budgets = Budget.all()
  erb(:"budgets/index")
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
