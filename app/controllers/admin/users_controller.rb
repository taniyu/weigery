class Admin::UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :admin_user!
  before_action :load_user, except: [:index]

  def index
    @users = User.order(updated_at: :desc).page(params[:page]).per(20)
  end

  def show
  end

  def edit
  end

  def update
  end

  def new
  end

  def create
  end

  def destroy
    @user.destroy
    render :reload
  end

  def lock
    @user.lock_access!
    render :reload
  end

  def unlock
    @user.unlock_access!
    render :reload
  end

  private

  def load_user
    return unless params[:id]
    @user = User.find_by(id: params[:id])
  end
end
