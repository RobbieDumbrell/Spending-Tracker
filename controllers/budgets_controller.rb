require('sinatra')
require('sinatra/contrib/all')
require_relative('../models/budget')
also_reload('../models/*')

# Index Budgets
get '/budgets/?' do
  @all_budgets = Budget.all()
  erb(:"budgets/index")
end
