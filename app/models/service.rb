class Service < ApplicationRecord
    has_many :tags_offerings, as: offering
    has_many :favorites, as: :offering
    has_many :messages, as:offering
    has_many :tags, through: :tags_offerings
    belongs_to :user
end
