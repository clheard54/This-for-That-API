class Favorite < ApplicationRecord
    belongs_to :user
    belongs_to :offering, polymorphic:true
end
