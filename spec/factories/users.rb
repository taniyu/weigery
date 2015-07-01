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

FactoryGirl.define do
  factory :user do
    email 'test@stu.kagawa-u.ac.jp'
    password 'password'
    name 'test name'
    birth Date.today
    account 'test'
    sex 0
    role 0
  end

  factory :admin, class: User do
    email 'test@eng.kagawa-u.ac.jp'
    password 'password'
    name 'test admin'
    birth '1987-01-21'.to_date
    account 'admin'
    sex 1
    role 100
  end
end
