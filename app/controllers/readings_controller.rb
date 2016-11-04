class ReadingsController < ApplicationController
  def index
    readings = User.find(params[:user_id]).readings
    @readings = readings.created_today
  end
end
