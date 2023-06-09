require 'rails_helper'

RSpec.describe Category, type: :model do
  before(:each) do
    @user = User.create(name: 'Rita Daniel', email: 'rita@gmail.com', password: '123456',
                        password_confirmation: '123456', confirmation_token: nil, confirmed_at: Time.now)
    @category = Category.create(name: 'Test', author: @user)
    allow(@category.icon).to receive(:attached?).and_return(true)
  end

  describe 'validations' do
    it 'is valid with valid attributes' do
      expect(@category).to be_valid
    end

    it 'is not valid without a name' do
      @category.name = nil
      expect(@category).to_not be_valid
    end

    it 'is not valid without an icon' do
      allow(@category.icon).to receive(:attached?).and_return(false)
      expect(@category).to_not be_valid
    end

    it 'is not valid without an author' do
      @category.author = nil
      expect(@category).to_not be_valid
    end
  end
end
