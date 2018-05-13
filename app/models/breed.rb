class Breed < ActiveRecord::Base
  has_many :dogs
  validates :name, presence: true

  #scope :top -> (limit)

  before_save do
    self.name = self.name.downcase.titleize
  end

  def self.top(rank)
    Breed.left_joins(:dogs).group(:name).order('COUNT(dogs.breed_id) DESC')[rank-1]
  end
end
