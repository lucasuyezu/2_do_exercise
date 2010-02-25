class AddDeviseToUsers < ActiveRecord::Migration
  def self.up
    change_table :users do |t|
      t.authenticatable
      t.confirmable
      t.recoverable
      t.rememberable
      t.trackable
      t.lockable
    end
  end

  def self.down
  end
end
