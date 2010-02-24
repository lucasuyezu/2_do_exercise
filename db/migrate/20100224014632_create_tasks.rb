class CreateTasks < ActiveRecord::Migration
  def self.up
    create_table :tasks do |t|
      t.string :name
      t.date :completed_at
      t.references :task_list
      t.timestamps
    end

    change_table :tasks do |t|
      t.index :task_list_id
    end
  end

  def self.down
    drop_table :tasks
  end
end
