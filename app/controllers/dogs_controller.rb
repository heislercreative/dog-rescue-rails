class DogsController < ApplicationController
  before_action :admin_authentication_required, except: [:index, :show, :update]
  before_action :get_breeds, only: [:new, :create, :edit, :update]

  def index
    if User.all.empty?
      redirect_to signup_path
    else
      @dogs = User.shelter_admin.dogs.sort_by{|d| d.name}
    end
  end

  def show
    @dog = Dog.find(params[:id])
    respond_to do |format|
      format.html { render :show }
      format.json { render json: @dog }
    end
  end

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

  def edit
    @user = User.shelter_admin
    @dog = Dog.find(params[:id])
  end

  def update
    @dog = Dog.find(params[:id])
    @dog.update(dog_params)
    if @dog.save
      redirect_to root_path
    else
      render :edit
    end
  end

  def destroy
    Dog.find(params[:id]).destroy
    redirect_to dogs_path
  end

  private

  def dog_params
    params.require(:dog).permit(:name, :breed_name, :gender, :age, :trained, :fee, :description, :user_id)
  end

  def get_breeds
    @breeds = Breed.all
  end

end
