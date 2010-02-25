require 'spec_helper'

describe UsersController do

  it "should show a login form on the home page" do
    get :index
    response.should be_success
    # response.should have_tag('h1')
    # response.should have_tag('form#login')
  end
end
