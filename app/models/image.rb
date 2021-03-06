class Image < ApplicationRecord
    belongs_to :offering, :polymorphic => true, inverse_of: :image
    has_attached_file :photo,
        styles: { thumb: ['32x32#', 'jpg'] },
        convert_options: {
        all: '-interlace Plane'
        },
        default_url: '/images/default_:style_photo.png'
    
    validates_attachment_presence :photo
   
end
