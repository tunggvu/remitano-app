require 'rails_helper'

RSpec.describe MoviesController, type: :controller do
  describe 'GET #index' do
    let(:movie) { FactoryBot.create :movie }
    it "renders the :index view" do
      get :index
      expect(response).to render_template :index
    end
  end

  describe 'POST #create' do
    let!(:user) { FactoryBot.create :user }
    before { login user }

    context 'when params is valid' do
      it 'should create a new movie' do
        expect do
          post :create, params: { movie: { url: 'https://www.youtube.com/watch?v=yLuLsNcZq_A', user_id: user.id } }
        end.to change(Movie, :count).by 1
      end

      it 'should redirect to root_path' do
        post :create, params: { movie: { url: 'https://www.youtube.com/watch?v=yLuLsNcZq_A', user_id: user.id } }
        expect(response).to redirect_to root_path
      end
    end

    context 'when params is invalid' do
      it 'should not create movie' do
        expect do
          post :create, params: { movie: { url: '', user_id: 1 } }
        end.to change(Movie, :count).by 0
      end

      it 'should render template new' do
        post :create, params: { movie: { url: '', user_id: 1 } }
        expect(response).to render_template :new
      end
    end
  end
end
