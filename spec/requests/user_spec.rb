require 'rails_helper'

RSpec.describe 'Users', type: :feature do
  before(:each) do
    @user = User.create(name: 'Rita Nkem', email: 'rita@gmail.com', password: '123456',
                        password_confirmation: '123456', confirmation_token: nil, confirmed_at: Time.now)
  end

  describe 'sign in page' do
    scenario 'should have a sign in page' do
      visit new_user_session_path
      expect(page).to have_content('LOGIN')
    end
  end

  describe 'sign up page' do
    scenario 'should have a sign up page' do
      visit new_user_registration_path
      expect(page).to have_content('REGISTRATION')
    end

    scenario 'should have a sign up button' do
      visit new_user_registration_path
      expect(page).to have_button('Sign up')
    end
  end

  describe 'forgot password page' do
    it 'should have a forgot password page' do
      visit new_user_password_path
      expect(page).to have_content('Forgot your password?')
    end

    it 'should have a send me reset password instructions button' do
      visit new_user_password_path
      expect(page).to have_button('Send me reset password instructions')
    end
  end
end
