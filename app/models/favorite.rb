class Favorite < ApplicationRecord
    belongs_to :user
    belongs_to :offering, :polymorphic => true, class_name: "::Profile"

    accepts_nested_attributes_for :offerings
end
