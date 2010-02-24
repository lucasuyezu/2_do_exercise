class Task < ActiveRecord::Base
  belongs_to :task_list

  validates_presence_of :task_list
  validates_associated :task_list
end
