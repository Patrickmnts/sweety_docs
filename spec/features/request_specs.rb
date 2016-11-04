require 'rails_helper'

RSpec.describe "Request Specs", :type => :feature do
  it "should render index view" do
    visit "/"
    expect(page).to have_content("Sweety - A blood glucose companion.")
    expect(page).to have_content("Current users of Sweety")
  end
end
