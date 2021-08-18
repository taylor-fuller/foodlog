class AddCategoryReferenceToEntries < ActiveRecord::Migration[6.1]
  def change
    add_reference :entries, :MealType
  end
end
