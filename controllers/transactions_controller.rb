require('sinatra')
require('sinatra/contrib/all')
require_relative('../models/transaction')
require_relative('../models/merchant')
require_relative('../models/category')
require_relative('../models/budget')
also_reload('../models/*')

# Index Transactions
get '/transactions/?' do
  @all_transactions = Transaction.all()
  @all_total_spend = Transaction.total_all()
  erb(:"transactions/index")
end

# Transactions by Month
get '/transactions/month/:month/?' do
  @month_transactions = Transaction.month_all(params['month'].to_i)
  @month_total_spend = Transaction.total_month(params['month'].to_i)
  @month_budget = Budget.find(params['month'].to_i)
  erb(:"transactions/index_by_month")
end

# New Transaction
get '/transactions/new/?' do
  @all_merchants = Merchant.all()
  @all_categories = Category.all()
  @today_date = Date.today()
  erb(:"transactions/new")
end

# Create Transaction
post '/transactions/?' do
  @new_transaction = Transaction.new(params)
  @new_transaction.save()
  redirect to '/transactions/?'
end

# Show Transaction
get '/transactions/:id/?' do
  @specified_transaction = Transaction.find(params['id'].to_i)
  @merchant = Merchant.find(@specified_transaction.merchant_id)
  @category = Category.find(@specified_transaction.category_id)
  erb(:"transactions/show")
end

# Edit Transaction
get '/transactions/:id/edit/?' do
  @all_merchants = Merchant.all()
  @all_categories = Category.all()
  @specified_transaction = Transaction.find(params['id'].to_i)
  @current_merchant = Merchant.find(@specified_transaction.merchant_id)
  @current_category = Category.find(@specified_transaction.category_id)
  erb(:"transactions/edit")
end

# Update Transaction
post '/transactions/:id/?' do
  changing_transaction = Transaction.new(params)
  changing_transaction.update()
  redirect to '/transactions/' + params['id']
end

# Delete Transaction
post '/transactions/:id/delete/?' do
  Transaction.delete_id(params['id'].to_i)
  redirect to '/transactions/'
end
