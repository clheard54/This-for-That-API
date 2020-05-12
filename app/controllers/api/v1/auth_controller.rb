class Api::V1::AuthController < ApplicationController

    def create
        @user = User.find_by(id: user_login_params[:id])
        @serialized = UserSerializer.new(@user)
        if @user && @user.authenticate(user_login_params[:password])
            @token = encode_token(@user)
            render json: { user: @serialized, jwt: @token }
        else
            render json: { error: 'Invalid username or password' }, status: :unauthorized
        end
    end

    def show
        @user = current_user
        if logged_in?
            render json: {id: @user.id, username: @user.username}
        else
            render json: { error: 'No user could be found'}, status: 401
        end
    end

    private
    def user_login_params
        params.require(:user).permit(:first_name, :last_name, :username, :password, :email, :location)
    end
end
