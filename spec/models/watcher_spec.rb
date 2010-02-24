require 'spec_helper'

describe Watcher do
  it "should create a watcher for a public task_list" do
    user = Factory(:user)
    public_task_list = Factory(:public_task_list)
    Factory.build(:watcher, :watching_user => user, :watching_task_list => public_task_list).should be_valid
  end

  it "should not create a watcher for a private task_list" do
    user = Factory(:user)
    private_task_list = Factory(:private_task_list)
    Factory.build(:watcher, :watching_user => user, :watching_task_list => private_task_list).should_not be_valid
  end
end
