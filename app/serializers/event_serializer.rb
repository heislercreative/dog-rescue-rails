class EventSerializer < ActiveModel::Serializer
  attributes :id, :title, :description, :date, :start_time, :end_time
  has_many :user_events
end
