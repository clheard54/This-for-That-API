class Api::V1::ItemsController < ApplicationController
    before_action :authorized, except: [:index, :create]

  def index
      @items = Item.all.with_attached_image
      render json: @items
  end

  def show
      @item = Item.find(params[:id])
      render json: @item
  end

  def create
    byebug
      @item = Item.new(item_params)
      if @item.valid?
          @item.save
          Cloudinary::Uploader.upload(item_params[:image])
          item_serializer = ItemSerializer.new(item: @item)
          render json: item_serializer.serialize_new_item()
      else
          render json: { error: 'Failed to submit item' }, status: :not_acceptable
      end
  end

  def update 
      @item = Item.find(params[:id])
      @item.update(course_params)
      render json: @item
  end

  def destroy
      @item = Item.find(params[:id])
      if @item 
          @item.destroy 
          render json: {message: "Item successfully deleted"}
      else 
          render json: {message: 'Could not delete item'}, status: :not_acceptable
      end
  end
  
    private
  
    def item_params
        params.require(:item).permit(
          [
            :item,
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