class CreateARecipeTable < ActiveRecord::Migration[5.1]
  def change
    create_table(:recipe) do |t|
      t.column(:ingredient_id, :integer)
      t.column(:category_id, :integer)
      t.column(:instructions, :string)
      t.column(:ratings, :integer)
    end
  end
end
