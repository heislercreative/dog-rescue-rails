class Event < ActiveRecord::Base
  has_many :tasks
end
