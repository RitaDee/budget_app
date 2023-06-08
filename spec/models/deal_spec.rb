require 'rails_helper'

RSpec.describe Deal, type: :model do
  let(:user) { User.create(name: 'Rita Nkem') }

  describe 'associations' do
    it 'belongs to an author' do
      association = described_class.reflect_on_association(:author)
      expect(association.macro).to eq(:belongs_to)
      expect(association.options[:class_name]).to eq('User')
    end

    it 'has many deal_category with dependent destroy' do
      association = described_class.reflect_on_association(:deal_category)
      expect(association.macro).to eq(:has_many)
      expect(association.options[:dependent]).to eq(:destroy)
    end

    it 'has many categories through deal_category' do
      association = described_class.reflect_on_association(:categories)
      expect(association.macro).to eq(:has_many)
      expect(association.options[:through]).to eq(:destroy)
    end
  end

  describe 'validations' do
    it 'requires a name' do
      deal = Deal.new(amount: 100, author: user)
      expect(deal.valid?).to be false
      expect(deal.errors[:name]).to include("can't be blank")
    end

    it 'requires an amount' do
      deal = Deal.new(name: 'Test Deal', author: user)
      expect(deal.valid?).to be false
      expect(deal.errors[:amount]).to include("can't be blank")
    end
  end

  describe 'instance methods' do
    let(:deal) { Deal.new(name: 'Test Deal', amount: 100, author: user) }

    it 'returns the correct name' do
      expect(deal.name).to eq('Test Deal')
    end

    it 'returns the correct amount' do
      expect(deal.amount).to eq(100)
    end

    it 'returns the correct author' do
      expect(deal.author).to eq(user)
    end
  end
end
