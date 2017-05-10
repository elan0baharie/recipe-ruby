require("bundler/setup")
Dir[File.dirname(__FILE__) + '/lib/*.rb'].each { |file| require file }
Bundler.require(:default)

get('/') do
  erb(:index)
end

get('/category') do
  @categories = Category.all()
  erb(:category)
end

get('/category/:id') do
  @category = Category.find(params.fetch("id").to_i())
  erb(:category_edit)
end

post('/category') do
  cat_type = params.fetch('cat_type')
  @new_category = Category.new({:name => cat_type})

  if @new_category.save()
    erb(:index)
  else
    erb(:error)
  end
end

patch('/category/:id') do
  cat_type = params.fetch('cat_type')
  @category = Category.find(params.fetch("id").to_i())
  @category.update({:name => cat_type})
  erb(:index)
end


delete('/category/:id') do
  @category = Category.find(params.fetch("id").to_i())
  @category.delete()
  erb(:index)
end

get('/ingredient') do
  @ingredients = Ingredient.all()
  erb(:ingredient)
end

post('/ingredient') do
  ingredient_name = params.fetch('ingredient_name')
  @new_ingredient = Ingredient.new({:name => ingredient_name})
  if @new_ingredient.save()
    erb(:index)
  else
    erb(:error)
  end
end

get('/ingredient/:id') do
  @ingredient = Ingredient.find(params.fetch("id").to_i())
  erb(:ingredient_edit)
end

delete('/ingredient/:id') do
  @ingredient = Ingredient.find(params.fetch("id").to_i())
  @ingredient.delete()
  erb(:index)
end

patch('/ingredient/:id') do
  ingredient_name = params.fetch('ingredient_name')
  @ingredient = Ingredient.find(params.fetch("id").to_i())
  @ingredient.update({:name => ingredient_name})
  erb(:index)
end

get('/recipe') do
  @recipes = Recipe.all()
  erb(:category)
end

get('/recipe/:id') do
  @category = Category.find(params.fetch("id").to_i())
  erb(:category_edit)
end

post('/recipe') do
  recipe_type = params.fetch('recipe_type')
  @new_recipe = Recipe.new({:name => recipe_type})

  if @new_recipe.save()
    erb(:index)
  else
    erb(:error)
  end
end
