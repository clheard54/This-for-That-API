class ItemSerializer < ActiveModel::Serializer
    attributes :id, :name, :description, :user_id, :location, :value
end