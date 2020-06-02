class ItemSerializer < ActiveModel::Serializer
    include Rails.application.routes.url_helpers

    attributes :id, :title, :type, :description, :user_id, :location, :value, :seeking, :tags, :image, :created_at

    def serialize_new_item()
        serialized_new_item = serialize_item(@item)
        serialized_new_item.to_json()
    end
      
      
    def image
        return unless object.image.attached?
      
        object.image.blob.attributes
            .slice('filename', 'byte_size')
            .merge(url: image_url)
            .tap { |attrs| attrs['name'] = attrs.delete('filename') }
        end
      
    def image_url
        url_for(object.image)
    end

    private def serialize_item(item)
        {
          item: {
            id: item.id,
            image_url: item.get_image_url(),
            title: item.title,
            description: item.description(),
            location: item.location,
            value: item.value,
            created_at: item.created_at,
            seeking: item.seeking,
            user_id: item.user_id
          }
        }
      end
end

