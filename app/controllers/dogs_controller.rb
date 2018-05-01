class DogsController < ApplicationController

  def new
    @user = User.shelter_admin
    @dog = @user.dogs.build
    @breeds = Breed.all
  end

  def create
    raise params.inspect
    Dog.create(dog_params)
  end

  def index
    @dogs = User.shelter_admin.dogs
  end

  def show
    @dog = Dog.find(params[:id])
  end

  private

  def dog_params
    params.require(:dog).permit(:name, :breed_name, :gender, :age, :trained, :fee, :description)
  end

end
