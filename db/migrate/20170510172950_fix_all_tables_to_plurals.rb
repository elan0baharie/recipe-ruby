class FixAllTablesToPlurals < ActiveRecord::Migration[5.1]
  def change
    create_table(:categories) do |t|
      t.column(:name, :string)

    end

    create_table(:ingredients) do |t|
      t.column(:name, :string)

    end

    create_table(:recipes) do |t|
      t.column(:ingredient_id, :integer)
      t.column(:category_id, :integer)
      t.column(:instructions, :string)
      t.column(:rating, :integer)
    end
  end
end
