require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe HomeController do
  def login(email, password)
    visit("/users/sign_in")
    fill_in 'Email', :with => email
    fill_in 'Password', :with => password
    click 'Sign in'
  end

  def logout
    visit("/home")
    click "Sign out"
  end

  before(:each) do
    @user = Factory(:user)
    @user.confirm!
  end

  it "should have a link to sign_in" do
    visit "/"
    page.should have_content("Sign in as User")
  end

  it "should login with correct email/password" do
    login(@user.email, @user.password)
    page.should have_content("Sign out")
    logout()
  end

  it "should not login with incorrect email/password" do
    login(@user.email, @user.password + "wrong")
    page.should have_content("Invalid email or password")
  end

end
