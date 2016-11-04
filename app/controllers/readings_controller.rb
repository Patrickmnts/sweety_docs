class ReadingsController < ApplicationController
  before_action :set_user
  
  def index
    readings = User.find(params[:user_id]).readings
    @readings = readings.created_today
  end

  private
  def set_user
    @user = User.find(params[:user_id])
  end
end
