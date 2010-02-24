class DestroyTaskListsUsersJoinTable < ActiveRecord::Migration
  def self.up
    drop_table :task_lists_users
  end

  def self.down
    create_table "task_lists_users", :id => false, :force => true do |t|
      t.integer "task_list_id"
      t.integer "user_id"
    end

    change_table :task_lists_users do |t|
      t.index :task_list_id
      t.index :user_id
    end
  end
end
