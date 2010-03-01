require File.expand_path(File.dirname(__FILE__) + "/../spec_helper")

story 'As a user I should be able to create task lists' do
  controller_name :task_lists

  scenario "I should be able to create a public list" do
    visit user_root_path
    click "Create a new to-do list"
    fill_in "Name", :with => "Weekend tasks"
    click "Save Changes"
  end

  scenario "I should be able to create a private list" do
    visit user_root_path
    click "Create a new to-do list"
    fill_in "Name", :with => "Medical tasks"
    check "Private"
    click "Save Changes"
  end
end
