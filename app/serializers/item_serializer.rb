class ItemSerializer < ActiveModel::Serializer
    attributes :id, :title, :description, :user_id, :location, :value, :seeking, :tags, :images, :created_at
end