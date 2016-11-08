class ReportsController < ApplicationController
  before_action :set_user

  def new
    @report = Report.new
  end

  def create
    report = Report.create(report_params)
    report.generate
    if report.save
      redirect_to user_report_path(@user, report)
    end
  end

  def show
    @report = Report.find(params[:id])
  end

  private
  def report_params
    params.require(:report).permit([:end_date, :report_type, :user_id])
  end

  def set_user
    @user = User.find(params[:user_id])
  end
end
