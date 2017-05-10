require('spec_helper')

describe(Ingredient) do
  describe('#recipes') do
    it("will return a recipe from ingredients provided") do
      test_recipe1 = Recipe.new({:name => "Hawaiian Pizza", :rating => 4})
      test_recipe2 = Recipe.new({:name => "Cheese Pizza", :rating => 4})
      test_ingredient1 = Ingredient.new({:name => "pizza sauce"})
      test_ingredient2 = Ingredient.new({:name => "pineapple"})
      test_ingredient3 = Ingredient.new({:name => "ham"})
      test_ingredient1.recipes.push(test_recipe1)
      test_ingredient1.recipes.push(test_recipe2)
      expect(test_ingredient1.recipes()).to(eq([test_recipe1, test_recipe2]))
    end
  end
end
