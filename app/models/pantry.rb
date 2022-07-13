class Pantry < ApplicationRecord
  validates :name, presence: true
  belongs_to :user
  has_many :foods, dependent: :destroy
end
