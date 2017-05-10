class MakeACatTable < ActiveRecord::Migration[5.1]
  def change
    create_table(:category) do |t|
      t.column(:name, :string)
    end
  end
end
