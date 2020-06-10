class Message < ApplicationRecord
    belongs_to :user
    belongs_to :offering, :polymorphic => true
    validates :recipient, presence: true

end
