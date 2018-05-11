class Breed < ActiveRecord::Base
  has_many :dogs
  validates :name, presence: true

  before_save do
    self.name = self.name.downcase.titleize
  end

  def self.most_popular
    all.sort_by{|b| b.dogs.count}.reverse.first
  end
end

# Breed.joins(:dogs).group(:name).count

# Breed.joins(:dogs).group(:name)

# Dog.joins(:breed).group(:breed).count.first
