class DogsController < ApplicationController

  def index
    @dogs = User.shelter_admin.dogs
  end

  def show
    @dog = Dog.find(params[:id])
  end

end
