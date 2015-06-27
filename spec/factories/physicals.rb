FactoryGirl.define do
  factory :physical do
    height '170.0'
    weight '51.3'
    sbp    '80'
    dbp    '50'
    pulse  '50'
    measurement_date Date.today
  end
end
