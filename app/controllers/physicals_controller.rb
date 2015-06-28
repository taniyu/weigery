class PhysicalsController < ApplicationController
  before_action :authenticate_user!, except: [:index]
  before_action :set_user, only: [:index, :create]
  before_action :set_physical, only: [:edit, :update, :destroy]

  def index
  end

  def new
    render :show_modal_form
  end

  def create
    @physical = @user.physicals.create(physical_params)
    render :reload
  end

  def edit
    render :show_modal_form
  end

  def update
    @physical.update(physical_params)
    render :reload
  end

  def destroy
    @physical.destroy
    render :reload
  end

  private

  def physical_params
    params[:physical].permit(
      :height, :weight,
      :sbp, :dbp, :pulse,
      :measurement_date
    )
  end

  def set_user
    return unless params[:user_id]
    @user = User.find(params[:user_id])
  end

  def set_physical
    return unless params[:id]
    @physical = Physical.find(params[:id])
  end
end
