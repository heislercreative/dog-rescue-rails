module DogHelper

  def is_trained?(dog)
    if dog.trained
      "Potty & Crate Trained: Yes"
    else
      "Potty & Crate Trained: No"
    end
  end

end
