class Entry < ApplicationRecord
    belongs_to :user
    has_many :foods, dependent: :destroy

    validates :meal_type, presence: { message: 'Please enter a valid meal name' }

    def day
        self.created_at.strftime("%B %e, %Y")
    end
end
