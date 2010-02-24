Factory.define :user do |u|
  u.name "user name"
end

Factory.define :public_task_list, :class => TaskList do |tl|
  tl.name "task list name"
  tl.public true
end

Factory.define :private_task_list, :class => TaskList do |tl|
  tl.name "task list name"
  tl.public true
end

Factory.define :task do |t|
  t.name "task name"
end