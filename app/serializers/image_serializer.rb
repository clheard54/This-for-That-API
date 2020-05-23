class ImageSerializer < ActiveModel::Serializer
    attributes :id, :offering_type, :offering_id, :photo, :url, :name, :created_at
end