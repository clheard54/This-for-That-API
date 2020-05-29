class ServiceSerializer < ActiveModel::Serializer
    include Rails.application.routes.url_helpers

    attributes :id, :title, :description, :user_id, :location, :value, :seeking, :tags, :image, :created_at

    def serialize_new_service()
        serialized_new_service = serialize_service(@service)
        serialized_new_service.to_json()
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

    private def serialize_service(service)
        {
          service: {
            id: service.id,
            image_url: service.get_image_url(),
            title: service.title,
            description: service.description(),
            location: service.location,
            value: service.value,
            created_at: service.created_at,
            seeking: service.seeking,
            user_id: service.user_id
          }
        }
      end
end