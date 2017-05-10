class AlterTableCategoriesToAddRecipeId < ActiveRecord::Migration[5.1]
  def change
    add_column(:categories, :recipe_id, :integer)
  end
end
