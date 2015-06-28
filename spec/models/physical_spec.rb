# == Schema Information
#
# Table name: physicals
#
#  id               :integer          not null, primary key
#  user_id          :integer          default(0), not null
#  height           :float            default(0.0), not null
#  weight           :float            default(0.0), not null
#  sbp              :integer          default(0), not null
#  dbp              :integer          default(0), not null
#  pulse            :integer          default(0), not null
#  bmi              :float            default(0.0), not null
#  measurement_date :date             not null
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#

require 'rails_helper'

RSpec.describe Physical, type: :model do
  context 'PhiscalはUserに所属している' do
    it 'belongs_to: users' do
      is_expected.to belong_to(:user)
    end
  end
  context '#calc_bmi' do
    let(:physical) { FactoryGirl.create(:physical) }
    it '正しい計算結果を返す' do
      expect(physical.bmi).to eq 20.761245674740486
    end
  end
end
