Factory.define :user do |u|
  u.name "user name"
end

Factory.define :task_list do |tl|
  tl.association :user
  tl.name "task list name"
  tl.public true
end

Factory.define :public_task_list, :class => TaskList do |tl|
  tl.association :user
  tl.name "task list name"
  tl.public true
end

Factory.define :private_task_list, :class => TaskList do |tl|
  tl.association :user
  tl.name "task list name"
  tl.public false
end

Factory.define :task do |t|
  t.association :task_list
  t.name "task name"
end

Factory.define :watcher do |w|
end
