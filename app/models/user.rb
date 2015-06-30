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

class User < ActiveRecord::Base
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :lockable
  attr_accessor :login

  has_many :physicals
  has_many :group_users
  has_many :groups, through: :group_users

  before_save :update_account!

  delegate :hw_graph, to: :physicals
  delegate :bpp_graph, to: :physicals

  module Role
    GENERAL = 0
    ADMIN = 100
  end

  def admin?
    Role::ADMIN <= role
  end

  def update_account!
    self.account = email.split('@').first
  end

  def update_without_current_password(params, *options)
    params.delete(:current_password)
    params.delete(:password) if params[:password].blank?
    params.delete(:password_confirmation) if params[:password_confirmation].blank?

    clean_up_passwords
    update_attributes(params, *options)
  end

  def self.find_first_by_auth_conditions(warden_conditions)
    conditions = warden_conditions.dup
    login = conditions.delete(:login)
    if login
      find_by(['account = :value OR email = :value', { value: login }])
    else
      find_by(conditions)
    end
  end
end
