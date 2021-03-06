class ReadingsController < ApplicationController
  before_action :set_user

  def index
    readings = User.find(params[:user_id]).readings
    @readings = readings.created_today
  end

  def create
    reading = Reading.new(reading_params)
    if reading.save
      flash[:success] = "Reading successful"
      redirect_to user_readings_path(@user)
    else
      flash[:danger] = reading.errors.full_messages.first
      redirect_to user_readings_path(@user)
    end
  end

  def edit
    render 'readings/index'
  end

  private
  def reading_params
    params.require(:reading).permit([:value, :user_id])
  end

  def set_user
    @user = User.find(params[:user_id])
  end
end
