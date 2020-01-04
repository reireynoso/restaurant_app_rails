class ApplicationController < ActionController::API
    before_action :require_login

    def encode_token(payload)
        JWT.encode(payload, secret)
    end

    def auth_header
        request.headers["Authorization"]
    end

    def decoden_token
        if auth_header 
            token = auth_header.split(" ")[1]
            # byebug
            begin 
                JWT.decode(token, secret, true, algorithm: 'HS256')
            rescue JWT::DecodeError
                []
            end
        end
    end

    def session_user
        decoded_hash = decoden_token
        # byebug
        if !decoded_hash.empty?
            user_id = decoded_hash[0]["user_id"]
            @user = User.find_by(id: user_id)
        else
            nil
        end
    end

    def logged_in?
        !!session_user
    end

    def require_login
        render json: {errors: ["Please sign-up or login"]}, status: :unauthorized unless logged_in?
    end

    private

    def secret
        ENV["JWT_SECRET"]
    end
end
