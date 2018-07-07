class DogSerializer < ActiveModel::Serializer
  attributes :id, :name, :gender, :trained, :fee, :description
end
