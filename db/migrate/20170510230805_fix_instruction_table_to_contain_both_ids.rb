class FixInstructionTableToContainBothIds < ActiveRecord::Migration[5.1]
  def change
    add_column(:instructions, :ingredient_id, :integer)
    add_column(:instructions, :recipe_id, :integer)
  end
end
