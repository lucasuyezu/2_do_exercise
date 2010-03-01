require File.expand_path(File.dirname(__FILE__) + "/../spec_helper")

story 'As a user I should be able to edit my info' do
  controller_name :users

  before(:each) do
    @user = Factory(:user, :name => "Lucas")
    @user.confirm!
    login(@user.email, @user.password)
    visit edit_user_path(@user)
  end

  scenario "should edit the user's name" do
    fill_in "Name", :with => "Chiy"
    click "Save changes"
    visit user_root_path
    page.should have_content("Welcome, Chiy!")
  end

  scenario "should upload the user's avatar" do
    fill_in "Avatar", :with => File.expand_path(File.dirname(__FILE__) + "/avatar.png")
    click "Submit picture"
  end
end
