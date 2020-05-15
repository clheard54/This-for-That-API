class Item < ApplicationRecord
    validates :name, presence: true
    validates :description, presence: true
    belongs_to :user
    has_many :favorites, , as: :offering
    has_many :messages
end
