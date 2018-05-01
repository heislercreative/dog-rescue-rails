class Dog < ActiveRecord::Base
  belongs_to :user
  belongs_to :breed

  validates_presence_of :name, :age, :fee, :description
  validate :gender_set?

  def gender_set?
    errors.add(:gender, "must be male or female") unless self.gender == 'Male' || self.gender == 'Female'
  end

  def breed_name=(name)
    self.breed = Breed.find_or_create_by(name: name)
  end

  def breed_name
    self.breed.name if self.breed
  end

end
