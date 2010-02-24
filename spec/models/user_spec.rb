require 'spec_helper'

describe User do
  it "should create a new instance given valid attributes" do
    Factory(:user).should be_valid
  end
end
