require 'rails_helper'

describe "User" do
  before(:each) do
    @user = User.create(first_name: 'Patrick', last_name: 'Test')
  end

  it 'should be able to create new User' do
    expect(@user).to be_valid
  end

  it 'should be able to have many readings' do
    reading1 = @user.readings.create
    reading2 = @user.readings.create

    expect(@user.readings.length).to eq(2)
    expect(@user.readings).to include(reading1)
    expect(@user.readings).to include(reading2)
  end

  it 'should make sure only 4 readings are taken each day' do
    4.times do
      @user.readings.create
    end

    expect(@user.valid?).to eq(true)

    @user.readings.create

    expect(@user.valid?).to eq(false)
    expect(@user.errors.messages[:readings]).to include("You may only submit four readings today.")
  end
end
