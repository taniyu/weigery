# == Schema Information
#
# Table name: groups
#
#  id         :integer          not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'rails_helper'

RSpec.describe Group, type: :model do
  context 'GroupはGroupUserを通してUserを複数持っている' do
    it 'has_many :group, through: :group_users' do
      is_expected.to have_many(:users).through(:group_users)
    end
  end
  context 'GroupはGroupUserを複数持っている' do
    it 'has_many :group?' do
      is_expected.to have_many(:group_users)
    end
  end
end
