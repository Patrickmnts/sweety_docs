require 'rails_helper'

describe "Reading" do
  before(:each) do
    @user = User.create(first_name: 'Patrick', last_name: 'Test')
    @reading = @user.readings.create
  end

  it 'should be able to create new User' do
    expect(@reading).to be_valid
  end
end
