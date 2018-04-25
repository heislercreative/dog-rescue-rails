class Dog < ActiveRecord::Base
  belongs_to :user
  belongs_to :breed

  validates_presence_of :name, :age, :trained, :fee
  validate :gender_set?

  def gender_set?
    self.gender == 'm' || self.gender == 'f'
  end

end
