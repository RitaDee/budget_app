class DealCategory < ApplicationRecord
  belongs_to :category
  belongs_to :deal

  validates :category_id, presence: true
  validates :deal_id, presence: true
end
