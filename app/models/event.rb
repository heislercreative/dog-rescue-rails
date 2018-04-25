class Event < ActiveRecord::Base
  has_many :user_events
  has_many :users, through: :user_events

  validates_presence_of :title, :description, :datetime
end
