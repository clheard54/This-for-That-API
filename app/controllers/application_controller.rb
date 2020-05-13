class ApplicationController < ActionController::API

    def encode_token(user)
        JWT.encode( {user_id: user.id, username: user.username}, 'uHave-iWant', 'HS256')
    end

    def decoded_token
        begin
            JWT.decode(token, 'uHave-iWant', true, algorithm: 'HS256')
        rescue
            JWT::DecodeError
            [{error: "Invalid Token"}]
        end
    end

    def token
        request.headers['Authorization']
    end

    def user_id
        decoded_token.first['user_id']
    end

    def authorized
        render json: {message: "Please log in"}, status: :unauthorized unless logged_in?
    end
    

    def current_user
        @user ||= User.find_by(id: user_id)
    end

    def logged_in?
        !!current_user
    end
end
