class Api::V1::ServicesController < ApplicationController
    before_action :authorized, except: :index
    
  def index
      @services = Service.all
      render json: @services
  end

  def show
      @service = Service.find(params[:id])
      render json: @service
  end

  def create
      @service = Service.new(service_params)
      if @service.valid?
          @service.save
          render json: { service: ServiceSerializer.new(@service)}
      else
          render json: { error: 'Failed to submit posting' }, status: :not_acceptable
      end
  end

  def update 
      @service = Service.find(params[:id])
      @service.update(service_params)
      render json: @service
  end

  def destroy
      @service = Service.find(params[:id])
      if @service 
          @service.destroy 
          render json: {message: "Posting successfully deleted"}
      else 
          render json: {message: 'Could not delete post'}, status: :not_acceptable
      end
  end

  private
  
    def service_params
        params.require(:service).permit(
          [
            :user_id,
            :title,
            :description,
            :location,
            :value,
            :seeking,
            images_attributes: %I[
              id
              photo
              _destroy
            ]
          ]
        )
      end
end
