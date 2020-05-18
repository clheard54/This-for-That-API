class TagsOffering < ApplicationRecord
    belongs_to :tag
    belongs_to :offering, polymorphic: true
end
