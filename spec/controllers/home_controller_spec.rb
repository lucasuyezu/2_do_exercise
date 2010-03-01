require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

story 'As a user I should be able to login, edit my info and create to-do lists' do
  controller_name :home

  before(:each) do
    @user = Factory(:user, :name => "Lucas")
    @user.confirm!
    login(@user.email, @user.password)
  end

  scenario "I should be able to edit my name" do
    page.should have_content("Edit my info")
  end

end
