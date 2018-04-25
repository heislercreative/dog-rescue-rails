class User < ActiveRecord::Base
  has_many :dogs
  has_many :events
  has_many :tasks, through: :events
end
