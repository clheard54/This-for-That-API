class Service < ApplicationRecord
    has_many :tags_offerings, :as => :offering
    has_many :favorites, :as => :offering
    has_many :messages, :as => :offering
    has_many :tags, through: :tags_offerings
    belongs_to :user
    has_many :images, :as => :offering

    accepts_nested_attributes_for :images, allow_destroy: true
    accepts_nested_attributes_for :tags

    def as_json(_opts = {})
    {
      id: id,
      user_id: user_id
      title: title,
      description: description,
      location: location,
      value: value,
      seeking: seeking,
      errors: errors,
      image_photos: images.map do |x|
        {
          url: x.photo.url.absolute_url,
          name: x.photo_file_name,
          id: x.id
        }
      end
    }
  end
end
