class MessageSerializer < ActiveModel::Serializer
    attributes :id, :message, :user_id, :recipient, :offering_id, :offering_type
end