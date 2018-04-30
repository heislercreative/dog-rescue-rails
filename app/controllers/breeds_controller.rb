class BreedsController < ApplicationController

  def show
    @breed = Breed.find(params[:id])
    @dogs = @breed.dogs.where(user_id: User.shelter_admin.id)
  end

end
