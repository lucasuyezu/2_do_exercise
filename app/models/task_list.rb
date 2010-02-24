class TaskList < ActiveRecord::Base
  belongs_to :user
  has_many :tasks
  has_many :watchers
  has_many :watching_users, :through => :watchers

  validates_presence_of :user
  validates_associated :user
end
