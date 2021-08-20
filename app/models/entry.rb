class Entry < ApplicationRecord
    has_many :foods

    validates :meal_type, presence: { message: 'Please enter a valid meal name' }

    def day
        self.created_at.strftime("%B %e, %Y")
    end
end
