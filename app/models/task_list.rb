class TaskList < ActiveRecord::Base
  belongs_to :user
  has_many :tasks
  has_many :watchers
  has_many :watching_users, :through => :watchers

  accepts_nested_attributes_for :tasks, :allow_destroy => true
end
