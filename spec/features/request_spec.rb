require 'rails_helper'

RSpec.describe "Request Specs", :type => :feature do
  before(:each) do
    @user = User.create(first_name: 'Test', last_name: 'User')
    @reading = @user.readings.create(value: 123)
  end

  it "should render index view" do
    visit "/"
    expect(page).to have_content("Sweety - A blood glucose companion.")
    expect(page).to have_content("Current users of Sweety")
    expect(page).to have_content(@user.full_name)
  end

  it 'should allow a user to see their readings from today' do
    visit "/"
    click_link "Test User"

    expect(page).to have_content(@reading.value)
  end
end
