require 'rails_helper'

RSpec.describe PhysicalsController, type: :controller do
  describe 'GET #index' do
    before do
      @user = FactoryGirl.create(:user)
      @physical = FactoryGirl.create(:physical)
    end
    it 'returns http success' do
      get :index, user_id: @user
      expect(response).to have_http_status(:success)
    end
    it 'ユーザがログインした状態で身体情報作成ページ閲覧' do
      sign_in @user
      xhr :get, :new, user_id: @user
      expect(response).to have_http_status(:success)
    end
    it 'ユーザがログインした状態で身体情報編集ページ閲覧' do
      sign_in @user
      xhr :get, :edit, user_id: @user, id: @physical
      expect(response).to have_http_status(:success)
    end
  end
end
