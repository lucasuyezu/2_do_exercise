require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe HomeController do

  def login(email, password)
    visit("/users/sign_in")
    fill_in 'Email', :with => email
    fill_in 'Password', :with => password
    click 'Sign in'
  end

  it "should login with correct email/password" do
    user = Factory(:user)
    login(user.email, user.password)
    page.should have_content("Signed in successfully")
  end

  it "should not login with incorrect email/password" do
    user = Factory(:user)
    login(user.email, user.password + "wrong")
    page.should have_content("Invalid email or password")
  end

end
