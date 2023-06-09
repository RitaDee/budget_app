require 'rails_helper'

RSpec.feature 'CategoriesIndices', type: :feature do
  describe 'Categories Index' do
    let(:file) { fixture_file_upload(Rails.root.join('spec', 'support', 'assets', 'test1.webp'), 'image/webp') }
    before :each do
      visit new_user_session_path
      @user = User.create(name: 'ezekiel', email: 'ezekiel@example.com', password: '1111111111')
      @category = Category.create(name: 'Food', author: @user)
      @category.icon.attach(file)
      @categorytwo = Category.create(name: 'Football', author: @user)
      @categorytwo.icon.attach(file)
      @categorythree = Category.create(name: 'Tacos', author: @user)
      @categorythree.icon.attach(file)
      @transaction = Deal.create(name: 'Athletics', amount: 100, author: @user)
      
      puts @category.errors.full_messages

      fill_in 'Email', with: @user.email
      fill_in 'Password', with: @user.password
      click_on 'Log in'
    end

    it 'should have a title' do
      expect(page).to have_current_path(categories_path)
      expect(page).to have_content('Categories')
    end

    it 'should have a link to create a new category' do
      expect(page).to have_current_path(categories_path)
      expect(page).to have_content('Add New category')
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
    expect(page).to have_current_path(categories_path)
      click_on @category.name
      expect(page).to have_current_path(category_deals_path(@category.id))
      expect(page).to have_content('TRANSACTION')
    end
  end
end