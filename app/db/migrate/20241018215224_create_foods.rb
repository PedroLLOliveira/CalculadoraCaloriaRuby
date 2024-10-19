class CreateFoods < ActiveRecord::Migration[7.1]
  def change
    create_table :foods do |t|
      t.string :name
      t.float :protein
      t.float :lipid
      t.float :carbohydrate
      t.references :food_group, null: false, foreign_key: true

      t.timestamps
    end
  end
end
