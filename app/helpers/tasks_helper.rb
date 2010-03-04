module TasksHelper
  def complete_task_button task
    if user_signed_in? and current_user == task.task_list.user
      button_to "I've done this task", complete_user_task_list_task_path(task.task_list.user, task.task_list, task)
    end
  end
end
