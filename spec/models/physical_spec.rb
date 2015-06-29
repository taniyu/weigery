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
  describe '#calc_bmi' do
    let(:physical) { FactoryGirl.create(:physical) }
    it '正しい計算結果を返す' do
      expect(physical.bmi).to eq 20.761245674740486
    end
  end

  describe '.hw_graph' do
    before do
      FactoryGirl.create(:user, id: 1)
      FactoryGirl.create(:user, id: 2, email: 'test2@gmail.com')
    end
    context '1人のユーザのみがデータを持っている場合' do
      let(:user) { User.find_by(id: 1) }
      before { FactoryGirl.create(:physical, user_id: user.id) }
      it 'そのユーザのデータを基にグラフを作成する' do
        expect(user.physicals.hw_graph.series_data.first[:data]).to eq [170.0]
        expect(user.physicals.hw_graph.series_data.second[:data]).to eq [60.0]
      end
    end
    context '複数のユーザがデータを持っている場合' do
      let(:user) { User.find_by(id: 1) }
      let(:user2) { User.find_by(id: 2) }
      before do
        FactoryGirl.create(:physical, user_id: user.id)
        FactoryGirl.create(:physical, user_id: user2.id, height: 160, weight: 50)
      end
      it 'そのユーザ自身の情報でグラフが作成できている' do
        expect(user.physicals.hw_graph.series_data.first[:data]).to eq [170.0]
        expect(user.physicals.hw_graph.series_data.second[:data]).to eq [60.0]
        expect(user2.physicals.hw_graph.series_data.first[:data]).to eq [160.0]
        expect(user2.physicals.hw_graph.series_data.second[:data]).to eq [50.0]
      end
    end
  end

  describe '.bpp_graph' do
    before do
      FactoryGirl.create(:user, id: 1)
      FactoryGirl.create(:user, id: 2, email: 'test2@gmail.com')
    end
    context '1人のユーザのみがデータを持っている場合' do
      let(:user) { User.find_by(id: 1) }
      before { FactoryGirl.create(:physical, user_id: user.id) }
      it 'そのユーザのデータを基にグラフを作成する' do
        expect(user.physicals.bpp_graph.series_data.first[:data]).to eq [100]
        expect(user.physicals.bpp_graph.series_data.second[:data]).to eq [60]
      end
    end
    context '複数のユーザがデータを持っている場合' do
      let(:user) { User.find_by(id: 1) }
      let(:user2) { User.find_by(id: 2) }
      before do
        FactoryGirl.create(:physical, user_id: user.id)
        FactoryGirl.create(:physical, user_id: user2.id, sbp: 90, dbp: 50)
      end
      it 'そのユーザ自身の情報でグラフが作成できている' do
        expect(user.physicals.bpp_graph.series_data.first[:data]).to eq [100]
        expect(user.physicals.bpp_graph.series_data.second[:data]).to eq [60]
        expect(user2.physicals.bpp_graph.series_data.first[:data]).to eq [90]
        expect(user2.physicals.bpp_graph.series_data.second[:data]).to eq [50]
      end
    end
  end
end
