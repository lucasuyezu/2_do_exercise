ActionController::Routing::Routes.draw do |map|
  map.devise_for :users
  map.resources :users do |users|
    users.resources :task_lists, :controller => "users/task_lists" do |task_lists|
      task_lists.resources :tasks, :controller => "users/task_lists/tasks", :member => {:complete => :post}
    end
  end
  map.resources :task_lists, :member => {:watch => :post}
  map.user_root "/home", :controller => :home, :action => :home

  map.root :controller => :home
end
