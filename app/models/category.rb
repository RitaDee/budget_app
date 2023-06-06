class Category < ApplicationRecord
  belongs_to :User, class_name: 'User'

  has_one_attached :icon
  has_many :deal_category, dependent: :destroy
  has_many :deal, through: :deal_category

  validates :name, presence: true
  validates :icon, presence: true
end
