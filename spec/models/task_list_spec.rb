require 'spec_helper'

describe TaskList do
  it "should create a new instance given valid attributes" do
    Factory.build(:public_task_list).should be_valid
    Factory.build(:private_task_list).should be_valid
  end
end
