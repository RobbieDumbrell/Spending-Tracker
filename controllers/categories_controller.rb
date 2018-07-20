require('sinatra')
require('sinatra/contrib/all')
require_relative('../models/category')
also_reload('../models/*')

# Index Categories
get '/categories/?' do
  @all_categories = Category.all()
  erb(:"categories/index")
end
