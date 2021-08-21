class Food < ApplicationRecord
  belongs_to :entry

  validates :calories, :proteins, :carbohydrates, :fats, numericality: { only_integer: true,
    message: "Please enter a valid number" }

  validates_presence_of :title, message: 'Please enter a valid meal name'
end
