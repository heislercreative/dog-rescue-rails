class Breed < ActiveRecord::Base
  has_many :dogs
  validates :name, presence: true

  scope :top, -> (rank) { left_joins(:dogs).group(:name).order('COUNT(dogs.breed_id) DESC')[rank-1] }

  before_save do
    self.name = self.name.downcase.titleize
  end
end
