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

  it 'should not show a users readings from yesterday' do
    new_reading = @user.readings.create(value: 213, created_at: DateTime.now - 1.day)
    visit '/'
    click_link "Test User"

    expect(page).to_not have_content(new_reading.value)
  end

  it 'should allow a user to see the new reading form if they are under todays limit' do
    visit '/'
    click_link "Test User"

    expect(page).to have_content('Submit new reading')
  end

  it 'should not allow a user to see new reading form if they are at the daily max' do
    3.times do
      @user.readings.create(value: rand(500))
    end

    visit '/'
    click_link "Test User"

    expect(page).to_not have_content('Submit new reading')
  end
end
