require 'rails_helper'

RSpec.describe PhysicalsController, type: :controller do
  describe 'GET #index' do
    before do
      @user = FactoryGirl.create(:user)
    end
    it 'returns http success' do
      get :index, user_id: @user
      expect(response).to have_http_status(:success)
    end
  end
end
