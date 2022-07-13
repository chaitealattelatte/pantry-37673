class Food < ApplicationRecord
  with_options presence: true do
    validates :name
    validates :purchase_day
  end

  belongs_to :pantry
end
