class Api::V1::UsersController < ApplicationController
    skip_before_action :require_login, only: [:create]
    def create
        # byebug
        # photo_url = Cloudinary::Uploader.upload(user_params[:photo_url])
        photo_url = upload_image_to_cloudinary(user_params[:photo_url])
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
        if params[:username] != "" && params[:photo_url] != nil
            # delete existing photo on cloudinary
            updated_photo_url = upload_image_to_cloudinary(params[:photo_url])
            session_user.update(username: params[:username], photo_url: updated_photo_url)
            update_user_json
        elsif params[:username] == "" && params[:photo_url] != nil
            # delete existing photo on cloudinary
            updated_photo_url = upload_image_to_cloudinary(params[:photo_url])
            session_user.update(photo_url: updated_photo_url)
            update_user_json
        elsif params[:username] != "" && params[:photo_url] == nil 
            existing_user = User.find_by(username: params[:username])
                if existing_user
                    render json: {errors: ["Username is taken"]}
                else
                    session_user.update(username: params[:username])
                    update_user_json
                end
            # puts session_user
        else
            render json: {errors: ["No changes made."]}
        end
        
    end

    def change_password
        # byebug
        render json: {success: "reached password path"}
    end

    private

    def upload_image_to_cloudinary(image)
        Cloudinary::Uploader.upload(image)
    end

    def update_user_json
        render json: {user: UserSerializer.new(session_user), success: "reached regular update path"}
    end

    def user_params
        params.permit(:username, :password, :photo_url)
    end
end
