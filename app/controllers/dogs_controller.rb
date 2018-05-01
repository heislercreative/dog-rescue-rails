class DogsController < ApplicationController
  before_action :get_breeds, only: [:new, :create, :edit, :update]


  def new
    @user = User.shelter_admin
    @dog = @user.dogs.build
  end

  def create
    @dog = Dog.new(dog_params)

    if @dog.save
      redirect_to dog_path(@dog)
    else
      render :new
    end
  end

  def index
    @dogs = User.shelter_admin.dogs
  end

  def show
    @dog = Dog.find(params[:id])
  end

  private

  def dog_params
    params.require(:dog).permit(:name, :breed_name, :gender, :age, :trained, :fee, :description, :user_id)
  end

  def get_breeds
    @breeds = Breed.all
  end

end
