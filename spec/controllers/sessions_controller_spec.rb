require 'rails_helper'

RSpec.describe SessionsController, type: :controller do
  describe 'POST #create' do
    context 'when params is valid' do
      let(:user) { FactoryBot.create :user }
      it 'should log in' do
        post :create, params: { session: { username: user.username, password: user.password } }
        expect(response).to have_http_status 200
      end
    end

    context 'when params is invalid' do
      it 'should render template new' do
        post :create, params: { session: { username: '', password: '' } }
        expect(response).to render_template :new
      end
    end
  end

  describe 'GET #destroy' do
    context 'when params is valid' do
      let(:user) { FactoryBot.create :user }
      before { post :create, params: { session: { username: user.username, password: user.password } } }
      it 'should log out' do
        get :destroy, params: { session: { username: user.username, password: user.password } }
        expect(response).to redirect_to root_path
      end
    end
  end
end
