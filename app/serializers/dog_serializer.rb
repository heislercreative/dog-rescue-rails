class DogSerializer < ActiveModel::Serializer
  attributes :id, :name, :gender, :trained, :fee, :description
  belongs_to :breed
  belongs_to :user
end
