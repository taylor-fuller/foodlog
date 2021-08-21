class CreateFoods < ActiveRecord::Migration[6.1]
  def change
    create_table :foods do |t|
      t.string :title
      t.integer :calories
      t.integer :proteins
      t.integer :carbohydrates
      t.integer :fats
      t.references :entry, null: false, foreign_key: true

      t.timestamps
    end
  end
end
