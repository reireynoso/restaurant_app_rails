class Api::V1::RatingsController < ApplicationController

    def create
        rating = Rating.find_by(user_id: session_user.id, dish_id: params[:parsedDishId])
        if rating
            # byebug
            rating.update(number: params[:rating])
            render json: rating.dish
        else
            rating = Rating.create(user_id: session_user.id, number: params[:rating], dish_id: params[:parsedDishId]) 
            render json: rating.dish
        end
    end
end
