class PhysicalsController < ApplicationController

  before_action :authenticate_user!, only: [:new, :edit, :destroy]
  before_action :set_user, only: [:new, :create, :edit, :update]
  before_action :set_physical, only: [:edit, :update, :destroy]

  def index
    @physicals = Physical.all
  end

  def new
    @physical = @user.physicals.new
  end

  def create
    @physical = @user.physicals.new(physical_params)
    if @physical.save
      redirect_to physicals_index_path
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    if @physical.update(physical_params)
      redirect_to physicals_index_path
    else
      render 'edit'
    end
  end

  def destroy
    @physical.destroy
    redirect_to physicals_index_path
  end

  private

  def physical_params
    params[:physical].permit(:height, :weight, :sbp, :dbp, :pulse, :bmi, :measurement_date)
  end

  def set_user
    @user = User.find(params[:user_id])
  end

  def set_physical
    @physical = Physical.find(params[:id])
  end
end

