class Api::V1::ImagesController < ApplicationController
    before_action :authorized

    def index
        @images = Image.all
        render json: @images
    end

    def create
        @image = Image.new(image_params)
        if @image.save
         flash[:notice] = "Successfully added new image!"
         render json: { image: ImageSerializer.new(@image) }
        else
            render json: { error: 'Failed to submit image' }, status: :not_acceptable
        end
       end

    private
       def image_params
        params.require(:image).permit(:title, :image)
       end

end
