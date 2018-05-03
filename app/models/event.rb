class Event < ActiveRecord::Base
  has_many :user_events
  has_many :users, through: :user_events

  validates_presence_of :title, :description, :date, :start_time, :end_time, :organizer_id
  validates :title, length: { maximum: 40 }
  validates :description, length: { minimum: 40 }

  def organizer
    User.find(self.organizer_id).name
  end

  def attendees
    self.users.map { |user| user.name }
  end

end
