require 'spec_helper'

describe TaskList do
  it "should create a new instance given valid attributes" do
    Factory(:public_task_list).should be_valid
    Factory(:private_task_list).should be_valid
  end
end
