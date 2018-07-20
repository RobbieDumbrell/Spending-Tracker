require('sinatra')
require('sinatra/contrib/all')
require_relative('../models/category')
also_reload('../models/*')

# Index Categories
get '/categories/?' do
  @all_categories = Category.all()
  erb(:"categories/index")
end

# New Category
get '/categories/new/?' do
  erb(:"categories/new")
end

# Create Category
post '/categories/?' do
  @new_category = Category.new(params)
  @new_category.save()
  redirect to '/categories/?'
end
