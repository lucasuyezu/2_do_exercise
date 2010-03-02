Factory.sequence(:email) {|n| "email#{n}@domain.com" }
Factory.sequence(:number) {|n| n }

Factory.define :user do |u|
  u.name "user name"
  u.email { Factory.next(:email) }
  u.password "123456"
  u.password_confirmation "123456"
end

Factory.define :task_list do |tl|
  tl.association :user
  tl.name { "task list name #{Factory.next(:number)}" }
  tl.public true
end

Factory.define :public_task_list, :class => TaskList do |tl|
  tl.association :user
  tl.name { "task list name #{Factory.next(:number)}" }
  tl.public true
end

Factory.define :private_task_list, :class => TaskList do |tl|
  tl.association :user
  tl.name { "task list name #{Factory.next(:number)}" }
  tl.public false
end

Factory.define :task do |t|
  t.association :task_list
  t.name "task name"
end

Factory.define :watcher do |w|
end
