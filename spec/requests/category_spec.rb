# require 'rails_helper'

# RSpec.describe CategoriesController, type: :controller do
#   describe 'POST #create' do
#     let(:user) { User.create(name: 'Test User', email: 'test@example.com', password: 'password') }

#     before { sign_in user }

#     context 'with valid parameters' do
#       let(:valid_params) do
#         {
#           category: {
#             name: 'Test Category',
#             icon: fixture_file_upload('path/to/test_icon.jpg', 'image/jpeg') # Assuming you have a test icon file
#           }
#         }
#       end

#       it 'creates a new category' do
#         expect {
#           post :create, params: valid_params
#         }.to change(Category, :count).by(1)

#         expect(response).to redirect_to(categories_path)
#         expect(flash[:notice]).to eq('Category was successfully created.')
#       end
#     end

#     context 'with invalid parameters' do
#       let(:invalid_params) do
#         {
#           category: {
#             name: '', # Invalid name
#             icon: fixture_file_upload('path/to/test_icon.jpg', 'image/jpeg')
#           }
#         }
#       end

#       it 'does not create a new category' do
#         expect {
#           post :create, params: invalid_params
#         }.not_to change(Category, :count)

#         expect(response).to render_template(:new)
#         expect(assigns(:category).errors[:name]).to include("can't be blank")
#       end
#     end
#   end
# end
