class TagsOffering < ApplicationRecord
    validates :name, presence: true
    validates :description, presence: true
    belongs_to :tag
    has_many :tags_offerings, as: offering
    has_many :messages
end
