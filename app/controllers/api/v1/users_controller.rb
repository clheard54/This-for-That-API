class Api::V1::UsersController < ApplicationController
    before_action :authorize, except [:create]
end
