require 'rails_helper'

describe "Report" do
  before(:each) do
    @user = User.create(first_name: "Test", last_name: "User")
    @reading = @user.readings.create(value: rand(300))
  end

  it 'should build a valid model' do
    report = @user.reports.create(report_type: 'daily', end_date: Date.today)
    expect(report).to be_valid
  end

 describe 'daily report' do
   it 'should only pull readings from specified day' do
     incorrect = @user.readings.create(value: rand(300), created_at: Date.today - 1.day)
     report = @user.reports.create(report_type: 'daily', end_date: DateTime.now.utc.to_date).generate

    #  byebug
     expect(report.get_readings_for_report).to include(@reading)
   end
 end
end
