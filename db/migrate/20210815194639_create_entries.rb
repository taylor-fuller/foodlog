class CreateEntries < ActiveRecord::Migration[6.1]
  def change
    create_table :entries do |t|
      t.string :meal_type
      t.date :diary_date

      t.timestamps
    end
  end
end
