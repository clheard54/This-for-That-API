class Api::V1::ServicesController < ApplicationController
    before_action :authorize, except: :index

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
