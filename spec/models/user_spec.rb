# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  reset_password_token   :string
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default(0), not null
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :inet
#  last_sign_in_ip        :inet
#  failed_attempts        :integer          default(0), not null
#  unlock_token           :string
#  locked_at              :datetime
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  name                   :string           default(""), not null
#  account                :string           default(""), not null
#  sex                    :integer
#  birth                  :date
#  role                   :integer          default(0), not null
#

require 'rails_helper'

RSpec.describe User, type: :model do
  context '管理者権限を持っている場合' do
    let(:user) { FactoryGirl.create(:user, role: 100) }
    it '#admin?' do
      expect(user.admin?).to eq true
    end
  end
  context '管理者権限を持っていない場合' do
    let(:user) { FactoryGirl.create(:user) }
    it '#admin?' do
      expect(user.admin?).to eq false
    end
  end

  context 'UserはGropUserを通してGroupを複数持っている' do
    it 'has_many :group, through: :group_users' do
      is_expected.to have_many(:groups).through(:group_users)
    end
  end
  context 'UserはGroupUserを複数持っている' do
    it 'has_many :group?' do
      is_expected.to have_many(:group_users)
    end
  end
  context 'UserはPhysicalを複数持っている' do
    it 'has_many :physicals?' do
      is_expected.to have_many(:physicals)
    end
  end
end
