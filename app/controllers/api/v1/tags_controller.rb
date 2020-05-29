class Api::V1::TagsController < ApplicationController
    
    def index
        @tags = Tag.all
        render json: @tags
    end

    def create
        @tag = Tag.new(tag_params)
        if @tag.valid?
            @tag.save
            render json: @tag
        else
            render json: {error: "Failed to create tag"}, status: :not_acceptable
        end
    end

  private
  
    def tag_params
        params.reguire(:tag).permit(:category)
    end
    
end
