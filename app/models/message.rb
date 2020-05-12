class Message < ApplicationRecord
    validates recipient, presence: true

    belongs_to :user
    belongs_to :item
    
end
