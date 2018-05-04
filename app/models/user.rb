class User < ActiveRecord::Base
  has_many :dogs
  has_many :user_events
  has_many :events, through: :user_events

  has_secure_password
  validates_presence_of :name, :email

  def self.shelter_admin
    User.find(1)
  end

  def is_admin?
    self.admin == true
  end
end
