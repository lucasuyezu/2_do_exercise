ActionController::Routing::Routes.draw do |map|
  map.devise_for :users

  map.home "/home", :controller => :home, :action => :home

  map.root :controller => :home
end
