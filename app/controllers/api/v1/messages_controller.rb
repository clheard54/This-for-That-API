class Api::V1::MessagesController < ApplicationController
    before_action :authorize, except: [:index]

end
