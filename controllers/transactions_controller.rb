require('sinatra')
require('sinatra/contrib/all')
require_relative('../models/transaction')
require_relative('../models/merchant')
require_relative('../models/category')
also_reload('../models/*')

# Index Transactions
get '/transactions/?' do
  @all_transactions = Transaction.all()
  erb(:"transactions/index")
end

# New Transaction
get '/transactions/new/?' do
  @all_merchants = Merchant.all()
  @all_categories = Category.all()
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
