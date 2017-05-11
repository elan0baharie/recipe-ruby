require("bundler/setup")
Bundler.require(:default)

Dir[File.dirname(__FILE__) + '/lib/*.rb'].each { |file| require file }


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
  @categories = Category.all()
  @ingredients = Ingredient.all()
  @recipes = Recipe.all()
  erb(:recipe)
end

get('/recipe/view') do
  @recipes = Recipe.all()
  erb(:recipe_view)
end

get('/recipe/:id') do
  @categories = Category.all()
  @ingredients = Ingredient.all()
  @recipe = Recipe.find(params.fetch("id").to_i())
  erb(:recipe_edit)
end

post('/recipe') do
  recipe_type = params.fetch('recipe_type')
  prep = params.fetch('prep')
  rating = params.fetch('rating')
  ingredient_ids = params.fetch('ingredient_ids', nil)
  category_ids = params.fetch('category_ids', nil)
  @new_recipe = Recipe.new({:name => recipe_type, :prep => prep, :rating => rating})
  if (ingredient_ids == nil) || (category_ids == nil)
    erb(:error)
  end
  @new_recipe.update({:ingredient_ids => ingredient_ids, :category_ids => category_ids})
  if @new_recipe.save()
    erb(:index)
  else
    erb(:error)
  end
end

patch('/recipe/:id') do
  recipe_type = params.fetch('recipe_type')
  prep = params.fetch('prep')
  rating = params.fetch('rating')
  ingredient_ids = params.fetch('ingredient_ids')
  category_ids = params.fetch('category_ids')
  @recipe = Recipe.find(params.fetch("id").to_i())
  if @recipe.update({:name => recipe_type, :prep => prep, :rating => rating, :ingredient_ids => ingredient_ids, :category_ids => category_ids})
    erb(:index)
  else
    erb(:error)
  end
end

delete('/recipe/:id') do
  @recipe = Recipe.find(params.fetch("id").to_i())
  @recipe.delete()
  erb(:index)
end
