class Api::V1::FavoritesController < ApplicationController
    before_action :authorized, except: :index

    def index
        @favorites = Favorite.all
        render json: @favorites
    end

    def create
        @favorite = Favorite.new(fave_params)

    end

    def destroy
        @favorite = Favorite.find(params[:id])
        if @favorite 
            @favorite.destroy 
            render json: {message: "Favorited status successfully deleted"}
        else 
            render json: {message: 'Could not delete favorite'}, status: :not_acceptable
        end
    end

    private
    
    def fave_params
        params.require(:favorite).permit(:user_id, :offering_type, :offering_id)
    end
end
