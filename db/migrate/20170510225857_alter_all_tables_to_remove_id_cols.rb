class AlterAllTablesToRemoveIdCols < ActiveRecord::Migration[5.1]
  def change
    remove_column(:recipes, :ingredient_id)
    remove_column(:recipes, :category_id)
    remove_column(:instructions, :ingredient_ids)
    remove_column(:instructions, :recipe_id)
  end

end
