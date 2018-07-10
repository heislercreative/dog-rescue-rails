class BreedsController < ApplicationController
  before_action :admin_authentication_required, only: [:index, :edit, :update, :destroy]

  def index
    @breeds = Breed.all.sort_by{|b| b.name}
    render json: @breeds, status: 200
  end

  def top
    @rank = params[:rank].to_i
    @breed = Breed.top(@rank)
    @dogs = @breed.dogs.where(user_id: User.shelter_admin.id)
    @adopted_dogs = @breed.dogs.where.not(user_id: User.shelter_admin.id)
  end

  def show
    @breed = Breed.find(params[:id])
    @dogs = @breed.dogs.where(user_id: User.shelter_admin.id)
    @adopted_dogs = @breed.dogs.where.not(user_id: User.shelter_admin.id)
  end

  def edit
     @breed = Breed.find(params[:id])
  end

  def update
    @breed = Breed.find(params[:id])
    @breed.update(breed_params)
    if @breed.save
      redirect_to breed_path
    else
      render :edit
    end
  end

  def destroy
    @breed = Breed.find(params[:id])
    if @breed.dogs == []
      @breed.destroy
      redirect_to breeds_path
    else
      @dogs = @breed.dogs.where(user_id: User.shelter_admin.id)
      @adopted_dogs = @breed.dogs.where.not(user_id: User.shelter_admin.id)
      flash[:notice] = "There are dogs associated with this breed. Please update or delete associated dogs before deleting the breed."
      render :show
    end
  end

  private

  def breed_params
    params.require(:breed).permit(:name)
  end
end
