class Favorite < ApplicationRecord
    belongs_to :user
    belongs_to :offering, :polymorphic => true

    accepts_nested_attributes_for :offering
end
