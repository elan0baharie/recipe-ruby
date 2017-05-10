class AlterRecipeTable < ActiveRecord::Migration[5.1]
  def change
    create_table(:instructions) do |t|
      t.column(:ingredient_ids, :integer)
      t.column(:recipe_id, :integer)
      t.column(:prep, :string)
    end
      remove_column(:recipes, :instructions)
  end
end
