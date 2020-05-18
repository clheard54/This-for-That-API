class Api::V1::ItemsController < ApplicationController
    before_action :authorized, except: [:index, :create]

  def index
      @items = Item.all
      render json: @items
  end

  def show
      @item = Item.find(params[:id])
      render json: @item
  end

  def create
      @item = Item.new(item_params)
      # byebug
      if @item.valid?
          @item.save
          render json: { item: ItemSerializer.new(@item)}
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
