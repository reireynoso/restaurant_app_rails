class Api::V1::UsersController < ApplicationController
    skip_before_action :require_login, only: [:create]
    def create
        # byebug
        photo_url = Cloudinary::Uploader.upload(user_params[:photo_url])
        user = User.create(user_params)
        user.update(photo_url: photo_url["url"])
        if user.valid?
            payload = {user_id: user.id}
            token = encode_token(payload)
            render json: {user: UserSerializer.new(user), token: token}
        else
            render json: {errors: user.errors.full_messages}, status: :not_acceptable
        end
    end

    def user_info
        ratings = session_user.user_ratings
        reviews = session_user.user_reviews

        render json: {reviews: reviews, ratings: ratings}
    end

    def update_user
        # byebug
        # puts params[:photo_url] == nil
        if params[:username] == ""
            session_user.update(photo_url: params[:photo_url])
        elsif params[:photo_url] == nil
            session_user.update(username: params[:username])
            puts session_user
        end
        render json: {user: UserSerializer.new(session_user), success: "reached regular update path"}
    end

    def change_password
        # byebug
        render json: {success: "reached password path"}
    end

    private

    def user_params
        params.permit(:username, :password, :photo_url)
    end
end
