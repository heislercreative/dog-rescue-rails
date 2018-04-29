class Dog < ActiveRecord::Base
  belongs_to :user
  belongs_to :breed

  validates_presence_of :name, :age, :trained, :fee
  validate :gender_set?

  def gender_set?
    errors.add(:gender, "must be male or female") unless self.gender == 'Male' || self.gender == 'Female'
  end

end
