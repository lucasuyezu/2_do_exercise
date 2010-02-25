ActionController::Routing::Routes.draw do |map|
  map.devise_for :users

  map.resources :home, :only => :index

  map.root :controller => :home
end
