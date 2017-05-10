class FixAllTablesToPlural < ActiveRecord::Migration[5.1]
  def change
    drop_table(:category)
    drop_table(:ingredient)
    drop_table(:recipe)
  end
end
