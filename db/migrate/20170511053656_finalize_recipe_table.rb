class FinalizeRecipeTable < ActiveRecord::Migration[5.1]
  def change
    add_column(:recipes, :prep, :string)
  
  end
end
