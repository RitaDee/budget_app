require 'rails_helper'

RSpec.feature 'Welcome Page', type: :feature do
  describe 'Welcome Page' do
    it 'should have a title' do
      visit root_path
      expect(page).to have_content('Diva Spends')
    end

    it 'should have a link to sign up' do
      visit root_path
      expect(page).to have_content('SIGN UP')
    end

    it 'should have a link to sign in' do
      visit root_path
      expect(page).to have_content('LOG IN')
    end
  end
end
