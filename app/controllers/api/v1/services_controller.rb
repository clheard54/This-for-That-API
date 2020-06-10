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
    @service = service.new(service_params)
    if !@service[:type]
      @service[:type]="Task"
    end
    if @service.valid?
        @service.save
        Cloudinary::Uploader.upload(service_params[:image])
        service_serializer = serviceSerializer.new(service: @service)
        render json: service_serializer.serialize_new_service()
    else
        render json: { error: 'Failed to submit item' }, status: :not_acceptable
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
    params.require(:item).permit(
      [
        :type,
        :user_id,
        :title,
        :description,
        :location,
        :value,
        :seeking,
        :image
      ]
    )
  end
  
end
