require 'rails_helper'

RSpec.describe 'devise/sessions/new.html.slim', type: :view do
  before do
    FactoryGirl.create(:user, id: 1)
    FactoryGirl.create(:admin, id: 2)
    visit new_user_session_path
  end
  let(:user) { User.find_by(id: 1) }
  context '一般ユーザーがemailでログイン' do
    it 'response ok' do
      fill_in 'user_login', with: user.email
      fill_in 'user_password', with: 'password'
      click_button 'ログイン'
      within first(:xpath, 'html') do
        expect(page).to have_content('マイページ')
        expect(page).to have_no_content('管理ページ')
      end
    end
  end
  let(:admin) { User.find_by(id: 2) }
  context '管理者がemailでログイン' do
    it 'response ok' do
      fill_in 'user_login', with: admin.email
      fill_in 'user_password', with: 'password'
      click_button 'ログイン'
      within first(:xpath, 'html') do
        expect(page).to have_content('管理ページ')
      end
    end
  end
end
