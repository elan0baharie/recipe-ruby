require("spec_helper")

describe(Recipe) do
  describe("#ingredients") do
    it("will return ingredients for a recipe with their associated ids") do
      test_ingredient1 = Ingredient.create({:name => "Basil"})
      test_ingredient2 = Ingredient.create({:name => "Pasta"})
      test_ingredient3 = Ingredient.create({:name => "Tomato"})
      test_recipe = Recipe.create({:name => "spaghetti"})
      test_recipe.ingredients.push(test_ingredient1)
      test_recipe.ingredients.push(test_ingredient2)
      test_recipe.ingredients.push(test_ingredient3)
      expect(test_recipe.ingredients()).to(eq([test_ingredient1, test_ingredient2, test_ingredient3]))
    end
  end

  describe("#categories") do
    it("will return categories for a recipe with their associated ids") do
      test_recipe = Recipe.create({:name => "Spaghetti", :prep => "cook pasta", :rating => 5})
      test_ingredient1 = Ingredient.create({:name => "Basil"})
      test_category = Category.create({:name => "Italian"})
      test_recipe.categories().push(test_category)
      expect(test_recipe.categories()).to(eq([test_category]))
    end
  end
end
