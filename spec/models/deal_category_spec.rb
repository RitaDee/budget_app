require 'rails_helper'

RSpec.describe DealCategory, type: :model do
  describe 'validations' do
    it 'requires category_id to be present' do
      deal_category = DealCategory.new(deal_id: 1)
      expect(deal_category.valid?).to be_falsey
      expect(deal_category.errors[:category_id]).to include("can't be blank")
    end

    it 'requires deal_id to be present' do
      deal_category = DealCategory.new(category_id: 1)
      expect(deal_category.valid?).to be_falsey
      expect(deal_category.errors[:deal_id]).to include("can't be blank")
    end
  end
end
