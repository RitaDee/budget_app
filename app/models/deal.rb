class Deal < ApplicationRecord
  belongs_to :User, class_name: 'User'

  has_many :deal_category, dependent: :destroy
  has_many :categories, through: :destroy

  validates :name, presence: true
  validates :amount, presence: true
end
