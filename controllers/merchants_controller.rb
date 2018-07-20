require('sinatra')
require('sinatra/contrib/all')
require_relative('../models/merchant.rb')
also_reload('../models/*')

# Index Merchants
get '/merchants/' do
  @all_merchants = Merchant.all()
  erb(:"merchants/index")
end
