require 'rails_helper'

RSpec.describe "Report Specs", :type => :feature do
  before(:each) do
    @user = User.create(first_name: "Patrick", last_name: "Test")
    visit('/')
    click_link("reports-link-#{@user.id}")
  end

  it "should allow a user to navigate to the new report page" do
    expect(page).to have_content("Run a report for #{@user.full_name}")
  end
end
