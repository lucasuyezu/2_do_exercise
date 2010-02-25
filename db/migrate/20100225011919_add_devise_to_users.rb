class AddDeviseToUsers < ActiveRecord::Migration
  def self.up
    change_table :users do |t|
      t.authenticatable
      t.recoverable
    end
  end

  def self.down
  end
end
