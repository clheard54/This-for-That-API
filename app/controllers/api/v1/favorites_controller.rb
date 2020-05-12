class Api::V1::FavoritesController < ApplicationController
    before_action :authorize, except [:index]

end
