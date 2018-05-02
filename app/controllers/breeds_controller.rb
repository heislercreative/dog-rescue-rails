class BreedsController < ApplicationController

  def show
    @breed = Breed.find(params[:id])
    @dogs = @breed.dogs.where(user_id: User.shelter_admin.id)
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

  # def destroy
    # @breed = Breed.find(params[:id])
    # if @breed.dogs == nil
      # @breed.destroy
      # redirect_to breeds_path
    # else
      # render :edit
    #end
  # end

  private

  def breed_params
    params.require(:breed).permit(:name)
  end

end
