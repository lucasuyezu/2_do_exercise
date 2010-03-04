class Users::TaskListsController < InheritedResources::Base
  before_filter :authenticate_user!, :except => [:index, :show]
  belongs_to :user

  def new
    new! do
      2.times { @task_list.tasks.build }
    end
  end

  def create
    create! { task_list_url(@task_list) }
  end

end
