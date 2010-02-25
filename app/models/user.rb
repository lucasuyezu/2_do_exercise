class User < ActiveRecord::Base
  has_many :task_lists
  has_many :watchers
  has_many :watching_task_lists, :through => :watchers

  devise :authenticatable, :confirmable, :lockable, :recoverable,
         :rememberable, :registerable, :trackable, :timeoutable, :validatable

  attr_accessible :email, :password, :password_confirmation
end
