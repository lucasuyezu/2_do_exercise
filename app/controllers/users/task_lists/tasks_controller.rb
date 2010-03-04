class Users::TaskLists::TasksController < InheritedResources::Base
  before_filter :authenticate_user!, :except => [:index, :show]
  belongs_to :task_list

  def complete
    @task = Task.find params["id"]
    if @task
      @task.completed_at = Time.now
      @task.save
      redirect_to task_list_path(@task.task_list)
    else
      redirect_to root_path
    end
  end
end
