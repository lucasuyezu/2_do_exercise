class UsersController < InheritedResources::Base
  before_filter :authenticate_user!, :except => [:index, :show]
end
