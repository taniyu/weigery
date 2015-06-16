class User < ActiveRecord::Base
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :lockable

  module Role
    GENERAL = 0
    ADMIN = 100
  end

  def admin?
    Role::ADMIN <= role
  end
end
