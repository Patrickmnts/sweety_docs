require 'rails_helper'

RSpec.describe "New Reading Specs", :type => :feature do
  before(:each) do
    user = User.create(first_name: "Patrick", last_name: "Test")
    visit('/')
    click_link(user.full_name)
  end

  it "should allow a user to submit a new reading" do
    fill_in "reading_value", with: '999'
    click_button "Save Reading"

    expect(page).to have_content("Reading successful")
    expect(page).to have_content('999')
  end
end
