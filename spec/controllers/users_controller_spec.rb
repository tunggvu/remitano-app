require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  describe 'POST #create' do
    context 'when params is valid' do
      it 'should create a new user' do
        expect do
          post :create, params: { user: FactoryBot.attributes_for(:user) }
        end.to change(User, :count).by 1
      end

      it 'should redirect to root_path' do
        post :create, params: { user: FactoryBot.attributes_for(:user) }
        expect(response).to redirect_to root_path
      end
    end

    context 'when params is invalid' do
      it 'should not create user' do
        expect do
          post :create, params: { user: { username: nil } }
        end.to change(User, :count).by 0
      end

      it 'should render template new' do
        post :create, params: { user: { username: nil } }
        expect(response).to render_template :new
      end
    end
  end
end
