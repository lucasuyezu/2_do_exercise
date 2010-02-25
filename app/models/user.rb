class User < ActiveRecord::Base
  has_many :task_lists
  has_many :watchers
  has_many :watching_task_lists, :through => :watchers

  devise :authenticatable, :recoverable
end
