class TaskListsController < InheritedResources::Base
  before_filter :authenticate_user!, :except => [:index, :show]

  def index
    @task_lists = user_signed_in? ? TaskList.public_and_mine(current_user) : TaskList.all_public
  end

  def show
    show! do |format|
      @show_watch_button = user_signed_in? and current_user != @task_list.user
      unless @task_list.public?
        if user_signed_in?
          format.html { redirect_to root_path unless current_user == @task_list.user }
        else
          format.html { redirect_to root_path }
        end
      end
    end
  end

  def watch
    if request.post? and user_signed_in?
      @task_list = TaskList.find params["id"]
      @task_list.watching_users << current_user
      flash[:notice] = "You are now watching this task list!"
    end
    redirect_to task_list_path(@task_list)
  end
end
