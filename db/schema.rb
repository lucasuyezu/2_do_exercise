# This file is auto-generated from the current state of the database. Instead of editing this file, 
# please use the migrations feature of Active Record to incrementally modify your database, and
# then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your database schema. If you need
# to create the application database on another system, you should be using db:schema:load, not running
# all the migrations from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20100225011919) do

  create_table "task_lists", :force => true do |t|
    t.string   "name"
    t.boolean  "public",     :default => true
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "task_lists", ["public"], :name => "index_task_lists_on_public"
  add_index "task_lists", ["user_id"], :name => "index_task_lists_on_user_id"

  create_table "tasks", :force => true do |t|
    t.string   "name"
    t.date     "completed_at"
    t.integer  "task_list_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "tasks", ["task_list_id"], :name => "index_tasks_on_task_list_id"

  create_table "users", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "email",                              :default => "", :null => false
    t.string   "encrypted_password",   :limit => 40, :default => "", :null => false
    t.string   "password_salt",                      :default => "", :null => false
    t.string   "confirmation_token",   :limit => 20
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "reset_password_token", :limit => 20
    t.string   "remember_token",       :limit => 20
    t.datetime "remember_created_at"
    t.integer  "sign_in_count"
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.integer  "failed_attempts",                    :default => 0
    t.string   "unlock_token",         :limit => 20
    t.datetime "locked_at"
  end

  create_table "watchers", :force => true do |t|
    t.integer  "task_list_id"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "watchers", ["task_list_id"], :name => "index_watchers_on_task_list_id"
  add_index "watchers", ["user_id"], :name => "index_watchers_on_user_id"

end
