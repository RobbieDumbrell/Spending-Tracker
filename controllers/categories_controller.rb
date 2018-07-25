require('sinatra')
require('sinatra/contrib/all')
require_relative('../models/category')
also_reload('../models/*')

# Index Categories
get '/categories/?' do
  @all_categories = Category.all()
  search_entry = params['search']
  @searched_categories = Category.search(search_entry)
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

# Show Category
get '/categories/:id/?' do
  @specified_category = Category.find(params['id'].to_i)
  @category_transactions = @specified_category.all_transactions
  erb(:"categories/show")
end

# Edit Category
get '/categories/:id/edit/?' do
  @specified_category = Category.find(params['id'].to_i)
  erb(:"categories/edit")
end

# Update Category
post '/categories/:id/?' do
  changing_category = Category.new(params)
  changing_category.update()
  redirect to '/categories/' + params['id']
end

# Confirm Delete Category before actually deleting
get '/categories/:id/delete/confirm/?' do
  @deleting_category = Category.find(params['id'].to_i)
  erb(:"categories/confirm_delete")
end

# Delete Category
post '/categories/:id/delete/?' do
  Category.delete_id(params['id'].to_i)
  redirect to '/categories/'
end
