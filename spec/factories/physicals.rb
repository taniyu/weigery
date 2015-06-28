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

FactoryGirl.define do
  factory :physical do
    height 170
    weight 60
    sbp 100
    dbp 60
    pulse 10
    measurement_date Date.today
  end
end
