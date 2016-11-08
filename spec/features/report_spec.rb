require 'rails_helper'

RSpec.describe "Report Specs", :type => :feature do
  before(:each) do
    @user = User.create(first_name: "Patrick", last_name: "Test")
    @reading1 = @user.readings.create(value: rand(200))
    @reading2 = @user.readings.create(value: rand(200))

    visit('/')
    click_link("reports-link-#{@user.id}")
  end

  it "should be able to navgate reports page" do
    expect(page).to have_content("Run a report for #{@user.full_name}")
  end
end
