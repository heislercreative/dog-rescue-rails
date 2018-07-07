module DogHelper

  def is_trained?(dog)
    if dog.trained
      "Yes"
    else
      "No"
    end
  end

end
