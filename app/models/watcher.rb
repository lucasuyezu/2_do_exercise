class Watcher < ActiveRecord::Base
  belongs_to :watching_task_list, :class_name => "TaskList", :foreign_key => "task_list_id"
  belongs_to :watching_user, :class_name => "User", :foreign_key => "user_id"

  validates_presence_of :watching_task_list, :watching_user
  validates_associated :watching_task_list, :watching_user
  def validate
    errors.add_to_base("Task list must be public") unless watching_task_list.public?
  end
end
