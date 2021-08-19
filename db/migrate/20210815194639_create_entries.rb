class CreateEntries < ActiveRecord::Migration[6.1]
  def change
    create_table :entries do |t|
      t.integer :calories
      t.integer :proteins
      t.integer :carbohydrates
      t.integer :fats
      t.date :diary_date

      t.timestamps
    end
  end
end
