class Api::V1::ItemsController < ApplicationController
    before_action :authorize, except: :index

end
