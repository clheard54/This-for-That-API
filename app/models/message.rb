class Message < ApplicationRecord
    validates recipient, presence: true
    belongs_to :user
    belongs_to :offering, :polymorphic => true
    
end
