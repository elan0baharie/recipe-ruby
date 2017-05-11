class DropColumnForRecipeIdOffCategoryTable < ActiveRecord::Migration[5.1]
  def change
    remove_column(:categories, :recipe_id)
  end
end
