class CreateTaskListsUsersJoinTable < ActiveRecord::Migration
  def self.up
    create_table :task_lists_users, :force => true, :id => false do |t|
      t.references :task_list
      t.references :user
    end
    
    change_table :task_lists_users do |t|
      t.index :task_list_id
      t.index :user_id
    end
  end

  def self.down
    drop_table :task_lists_users
  end
end
