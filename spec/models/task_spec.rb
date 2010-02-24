require 'spec_helper'

describe Task do
  it "should create a new instance given valid attributes" do
    Factory.build(:task).should be_valid
  end
end
