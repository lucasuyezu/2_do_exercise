class CreateTaskLists < ActiveRecord::Migration
  def self.up
    create_table :task_lists do |t|
      t.string :name
      t.boolean :public, :default => true
      t.completed_at :date
      t.references :user

      t.timestamps
    end

    change_table :task_lists do |t|
      t.index :public
      t.index :user_id
    end
  end

  def self.down
    drop_table :task_lists
  end
end
