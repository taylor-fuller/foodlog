class Entry < ApplicationRecord
    validates :calories, :proteins, :carbohydrates, :fats, numericality: { only_integer: true,
        message: "Please enter a valid number" }
    validates_presence_of :meal_type, message: 'Please select an option'
end
