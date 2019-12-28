class Api::V1::UsersController < ApplicationController
    skip_before_action :require_login, only: [:create]
    def create
        user = User.create(user_params)
        if user.valid?
            payload = {user_id: user.id}
            token = encode_token(payload)
            render json: {user: user, token: token}
        else
            render json: {errors: user.errors.full_messages}, status: :not_acceptable
        end
    end

    def user_info
        ratings = session_user.user_ratings
        reviews = session_user.user_reviews

        render json: {reviews: reviews, ratings: ratings}
    end

    private

    def user_params
        params.permit(:username, :password)
    end
end
