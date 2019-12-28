class Api::V1::ReviewsController < ApplicationController

    def create
        # byebug
        review = Review.create(restaurant_id: params[:restaurant_id], user_id: session_user.id, comment: params[:comment])
        render json: review
    end

    def destroy
        review = Review.find(params[:id])
        # byebug
        if session_user.id != review.user_id
            render json: {errors: ["Not your comment!"]}
        elsif review == nil 
            render json: {errors: ["Review does not exist"]}
        else
            review.destroy
            render json: {success: "Review removed"}
        end
    end
end
