class Entry < ApplicationRecord
    belongs_to :MealType
    validates :calories, :proteins, :carbohydrates, :fats, numericality: { only_integer: true,
        message: "Please enter a valid number" }
    validates_presence_of :meal_type, message: 'Please select an option'

    def day
        self.created_at.strftime("%B %e, %Y")
    end
end
