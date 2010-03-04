require File.expand_path(File.dirname(__FILE__) + "/../spec_helper")

story Users::TaskListsController do

  story "As a logged in user I should be able to" do
    controller_name :task_lists
    before(:each) do
      @user = Factory(:user)
      @user.confirm!
      login(@user.email, @user.password)
      visit user_root_path
    end

    scenario "create a public list" do
      click "Create a new to-do list"
      fill_in "Task name", :with => "Weekend tasks"
      fill_in "task_list_tasks_attributes_0_name", :with => "Wash the car"
      fill_in "task_list_tasks_attributes_1_name", :with => "Skate in the park"
      click "Save changes"
      visit user_root_path
      page.should have_content("Weekend tasks")
      click "Weekend tasks"
      page.should have_content("Wash the car")
      page.should have_content("Skate in the park")
    end

    scenario "create a private list" do
      click "Create a new to-do list"
      fill_in "Task name", :with => "Medical tasks"
      fill_in "task_list_tasks_attributes_0_name", :with => "Go to the doctor"
      fill_in "task_list_tasks_attributes_1_name", :with => "Take pills"
      uncheck "Public"
      click "Save changes"
      visit user_root_path
      page.should have_content("Medical tasks")
      click "Medical tasks"
      page.should have_content("Go to the doctor")
    end
  end

  story "As a curious user" do
    controller_name :task_lists
    before(:each) do
      @me = Factory(:user)
      @me.confirm!
      @him = Factory(:user)
      @him.confirm!
      @public_task_list  = Factory(:public_task_list,  :user => @him)
      @private_task_list = Factory(:private_task_list, :user => @him)
      login(@me.email, @me.password)
      visit task_lists_path
    end

    scenario "I should be able to see another user's public to-do lists" do
      page.should have_content(@public_task_list.name)
      visit task_list_path(@public_task_list)
      page.should have_content(@public_task_list.name)
    end

    scenario "I should not be able to see another user's private to-do lists" do
      page.should_not have_content(@private_task_list.name)
      visit task_list_path(@private_task_list)
      page.should_not have_content(@private_task_list.name)
    end

    scenario "I should be able to watch another user's public to-do lists" do
      visit task_list_path(@public_task_list)
      click "Watch this task list"
      visit user_root_path
      page.should have_content(@public_task_list.name)
    end
  end

end
