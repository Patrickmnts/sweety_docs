require 'rails_helper'

describe "Report" do
  before(:each) do
    @user = User.create(first_name: "Test", last_name: "User")
    @reading1 = @user.readings.create(value: 300)
    @reading2 = @user.readings.create(value: 100)
  end

  it 'should build a valid model' do
    report = @user.reports.create(report_type: 'daily', end_date: Date.today)
    expect(report).to be_valid
  end

 describe 'daily report' do
   before(:each) do
     todays_date = DateTime.now.utc.to_date
     @report = @user.reports.create(report_type: 'daily', end_date: todays_date)
     @report.generate
   end

   it 'should only pull readings from specified day' do
     incorrect = @user.readings.create(value: rand(300), created_at: Date.today - 1.day)
     @report.generate

     expect(@report.get_readings_for_report).to include(@reading1)
     expect(@report.get_readings_for_report).to_not include(incorrect)
   end

   it 'should calculate the maximum' do
     expect(@report.maximum).to eq(300)
   end

   it 'should set the minimum' do
     expect(@report.minimum).to eq(100)
   end

   it 'should set the average' do
     expect(@report.average).to eq(200)
   end

   it 'should have the same start_date as end_date' do
     expect(@report.start_date).to eq(@report.end_date)
   end
 end

 describe 'month-to-date' do
   before(:each) do
     todays_date = DateTime.now.utc.to_date
     @report = @user.reports.create(report_type: 'month-to-date', end_date: todays_date)
     @report.generate
   end

   it 'should set start_date at beginning of month' do
     expect(@report.start_date).to eq(@report.end_date.beginning_of_month)
   end
 end

 describe 'monthly' do
   before(:each) do
     todays_date = DateTime.now.utc.to_date
     @report = @user.reports.create(report_type: 'monthly', end_date: todays_date)
     @report.generate
   end

   it 'should set start_date at a month prior' do
     expect(@report.start_date).to eq(@report.end_date - 1.month)
   end
 end


end
