class EventsDetailsSerializer < ActiveModel::Serializer
  attributes :id, :name, :private,
             :updated_at, :created_at
end
