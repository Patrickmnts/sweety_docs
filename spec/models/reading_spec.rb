require 'rails_helper'

describe "Reading" do
  before(:each) do
    @user = User.create(first_name: 'Patrick', last_name: 'Test')
    @reading = @user.readings.create
  end

  it 'should be able to create new User' do
    expect(@reading).to be_valid
  end

  it 'should know if it has been created today' do
    created_yesterday = Reading.create(created_at: DateTime.yesterday)
    expect(Reading.created_today).to include(@reading)
    expect(Reading.created_today).to_not include(created_yesterday)
  end
end
