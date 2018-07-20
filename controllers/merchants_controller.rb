require('sinatra')
require('sinatra/contrib/all')
require_relative('../models/merchant.rb')
also_reload('../models/*')

# Index Merchants
get '/merchants/?' do
  @all_merchants = Merchant.all()
  erb(:"merchants/index")
end

# New Merchant
get '/merchants/new/?' do
  erb(:"merchants/new")
end

# Create Merchant
post '/merchants/?' do
  @new_merchant = Merchant.new(params)
  @new_merchant.save()
  redirect to '/merchants/?'
end
