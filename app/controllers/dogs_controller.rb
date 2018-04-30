class DogsController < ApplicationController

  def index
    @dogs = User.shelter_admin.dogs
  end

end
