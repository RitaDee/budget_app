require 'rails_helper'

RSpec.feature 'CategoriesIndices', type: :feature do
  describe 'Categories Index' do
    let(:file) { fixture_file_upload(Rails.root.join('spec', 'support', 'assets', 'test1.webp'), 'image/webp') }
    before :each do
      visit new_user_session_path
      @user = User.create(name: 'riri', email: 'riri@example.com', password: '1111111111', confirmation_token: nil,
                          confirmed_at: Time.now)
      @category = Category.create(name: 'Food', author_id: @user.id)
      @category.icon.attach(file)
      @categorytwo = Category.create(name: 'Football', author_id: @user.id)
      @categorytwo.icon.attach(file)
      @categorythree = Category.create(name: 'Tacos', author_id: @user.id)
      @categorythree.icon.attach(file)
      @deal = Deal.create(name: 'Athletics', amount: 100, author_id: @user.id)

      fill_in 'Email', with: @user.email
      fill_in 'Password', with: @user.password
      click_on 'LOG IN'
    end

    it 'should have a title' do
      expect(page).to have_current_path(categories_path)
      expect(page).to have_content('Show this category')
    end

    it 'should have a link to create a new category' do
      expect(page).to have_current_path(categories_path)
      expect(page).to have_content('Add New Category')
    end

    it 'should have a category name' do
      expect(page).to have_current_path(categories_path)
      @categories = Category.all

      @categories.each do |category|
        expect(page).to have_content(category.name.capitalize)
      end

      expect(@categories.count).to eq(3)
    end

    it 'should link to the transaction index' do
      click_on @category.name
      expect(page).to have_current_path(category_operations_path(@category.id))
      expect(page).to have_content('Transactions')
    end
  end
end
