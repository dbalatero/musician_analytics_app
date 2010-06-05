require 'spec_helper'

describe User do
  before(:each) do
    @valid_attributes = {
      :login => 'dbalatero',
      :password => 'password',
      :password_confirmation => 'password'
    }
  end

  it "should create a new instance given valid attributes" do
    User.create!(@valid_attributes)
  end
end
