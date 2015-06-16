# == Schema Information
#
# Table name: group_users
#
#  id         :integer          not null, primary key
#  group_id   :integer
#  user_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'rails_helper'

RSpec.describe GroupUser, type: :model do
  context 'GroupUserはUserに所属している' do
    it 'belongs_to :user?' do
      is_expected.to belong_to(:user)
    end
  end
  context 'GroupUserはGroupに所属している' do
    it 'belongs_to :group?' do
      is_expected.to belong_to(:group)
    end
  end
end
