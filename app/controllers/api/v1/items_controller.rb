class Api::V1::ItemsController < ApplicationController
    before_action :authorize, except: :index

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
