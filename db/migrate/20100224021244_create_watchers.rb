class CreateWatchers < ActiveRecord::Migration
  def self.up
    create_table :watchers do |t|
      t.references :task_list
      t.references :user
      t.timestamps
    end

    change_table :watchers do |t|
      t.index :task_list_id
      t.index :user_id
    end
  end

  def self.down
    drop_table :watchers
  end
end
