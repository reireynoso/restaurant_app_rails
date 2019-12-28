class Api::V1::LoginController < ApplicationController
    skip_before_action :require_login, only: [:login]
    def login
        user = User.find_by(username: params[:username])
        if user && user.authenticate(params[:password])
            payload = {user_id: user.id}
            token = encode_token(payload)
            render json: {user: user, token: token}
        else
            render json: {errors: ["Invalid Credentials"]}, status: :not_acceptable
        end
    end

    def auto_login
        # byebug
        if session_user
            render json: session_user
        else
            render json: {errors: ["No user logged in"]}
        end
    end
end
