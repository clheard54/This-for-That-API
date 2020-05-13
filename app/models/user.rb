class User < ApplicationRecord
    has_secure_password
    validates username, uniqueness:true, presence:true
    validates :password, presence: true

    has_many :items
    has_many :favorites
    has_many :messages
    accepts_nested_attributes_for :items
    accepts_nested_attributes_for :favorites
    accepts_nested_attributes_for :messages
end
