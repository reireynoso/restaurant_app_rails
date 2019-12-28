class Api::V1::RestaurantsController < ApplicationController
    skip_before_action :require_login, only: [:index]
    
    def index
        restaurants = Restaurant.all
        # render json: restaurants
        # restaurantsReviewOrdered = restaurants.each do |restaurant|
        #     restaurant.reviews.order('reviews.created_at DESC')
        #     restaurant
        # end
        render json: restaurants, include: "**"
    end
    
end
