class PhysicalsController < ApplicationController

  # before_action :authenticate_user!, only: [:new, :edit]
  before_action :set_user, only: [:new, :create]
  before_action :set_physical, only: [:edit, :update, :destroy]

  def index
  end

  def new
    @physical = Physical.new
  end

  def create
    # TODO: bmi
    @physical = Physicals.new(physical_params)
    @physical.user_id = current_user.id
    @physical.save!
    render :reload
  end

  def show
    @physicals = Physical.all
  end

  def edit
  end

  def update
    if @physical.update(physical_params)
      redirect_to root_path
    else
      render 'new'
    end
  end

  def destroy
    @physical.destroy
    redirect_to root_path
  end

  private

  def physical_params
    params[:physical].permit(:height, :weight, :sdp, :dbp, :pulse, :bmi, :measurement_date)
  end

  def set_user
    @user = User.find(params[:user_id])
  end

  def set_physical
    @physical = Physical.find(params[:physical_id])
  end
end

