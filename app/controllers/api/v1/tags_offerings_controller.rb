class Api::V1::TagsOfferingsController < ApplicationController
    def index
        @all = TagsOffering.all
        render json: @all
    end

    def create
        @tag_offering = TagsOffering.new(tag_offering_params)
        if @tag_offering.valid?
            @tag_offering.save
            render json: @tag_offering
        else 
            render json: {error: 'Failed to associate item with tag(s)'}, status: :not_acceptable
        end
    end

  private

    def tag_offering_params
        params.permit(:tag_id, :offering_id, :offering_type)
    end

end