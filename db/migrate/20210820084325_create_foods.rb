class CreateFoods < ActiveRecord::Migration[6.1]
  def change
    create_table :foods do |t|
      t.string :title
      t.integer :food_calories
      t.integer :food_proteins
      t.integer :food_carbohydrates
      t.integer :food_fats
      t.references :entry, null: false, foreign_key: true

      t.timestamps
    end
  end
end
