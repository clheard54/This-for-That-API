class Api::V1::ImagesController < ApplicationController
    before_action :authorized

    def index
        @images = Image.all
        render json: @images
    end
end
