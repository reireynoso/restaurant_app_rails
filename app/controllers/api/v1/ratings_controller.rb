class Api::V1::RatingsController < ApplicationController

    def create
        rating = Rating.create(user_id: session_user.id, number: params[:rating], dish_id: params[:parsedDishId]) 
        # byebug
        render json: rating.dish
    end
end
