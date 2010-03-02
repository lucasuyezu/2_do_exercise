ActionController::Routing::Routes.draw do |map|
  map.devise_for :users
  map.resources :users, :member => {:avatar => :put} do |users|
    users.resources :task_lists, :controller => "users/task_lists" do |task_lists|
      task_lists.resources :tasks, :controller => "users/task_lists/tasks"
    end
  end
  map.resources :task_lists
  map.user_root "/home", :controller => :home, :action => :home

  map.root :controller => :home
end
