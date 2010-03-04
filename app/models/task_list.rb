class TaskList < ActiveRecord::Base
  belongs_to :user
  has_many :tasks
  has_many :watchers
  has_many :watching_users, :through => :watchers

  accepts_nested_attributes_for :tasks, :allow_destroy => true

  named_scope :public_and_mine, proc {|user| {:conditions => ["public = ? or (public = ? and user_id = ?)", true, false, user.id]}}
  named_scope :all_public, :conditions => {:public => true}
end
