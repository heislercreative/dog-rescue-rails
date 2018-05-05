class Breed < ActiveRecord::Base
  has_many :dogs
  validates :name, presence: true

  before_save do
    self.name = self.name.downcase.titleize
  end
end
