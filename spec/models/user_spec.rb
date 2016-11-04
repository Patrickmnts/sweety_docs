require 'rails_helper'

describe "User" do
  before(:each) do
    @user = User.create(first_name: 'Patrick', last_name: 'Test')
  end

  it 'should be able to create new User' do
    expect(@user).to be_valid
  end
end
