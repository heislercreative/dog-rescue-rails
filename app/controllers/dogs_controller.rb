class DogsController < ApplicationController

  def new
    @user = User.shelter_admin
    @dog = @user.dogs.build
  end

  def create
  end

  def index
    @dogs = User.shelter_admin.dogs
  end

  def show
    @dog = Dog.find(params[:id])
  end

end
