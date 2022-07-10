class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :pantries

  with_options presence: true do
  validates :nickname
  validates :family_name, format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]/ }
  validates :first_name, format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]/ }
  end
end
