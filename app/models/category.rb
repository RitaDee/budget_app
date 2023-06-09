class Category < ApplicationRecord
  belongs_to :author, class_name: 'User'

  has_one_attached :icon
  has_many :deal_categories, dependent: :destroy
  has_many :deals, through: :deal_categories

  validates :name, presence: true
  validates :icon, presence: true

  def calculate_amount
    deals.sum { |deal| deal.amount.to_i }
  end
end
