ActionController::Routing::Routes.draw do |map|
  map.devise_for :users
  map.resources :users, :member => {:avatar => :put} do |users|
    users.resources :task_lists
  end
  map.user_root "/home", :controller => :home, :action => :home

  map.root :controller => :home
end
