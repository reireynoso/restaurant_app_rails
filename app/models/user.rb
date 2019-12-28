class User < ApplicationRecord
    has_secure_password
    validates_uniqueness_of :username
    validates_presence_of :username
    has_many :ratings, :dependent => :delete_all
    has_many :reviews, :dependent => :delete_all

    def user_reviews
        
        self.reviews.order(created_at: :desc).map do |review|    
            # byebug
            {
                id: review.id,
                comment: review.comment,
                restaurant: {
                    name: review.restaurant.name,
                    city: review.restaurant.city,
                    state: review.restaurant.state,
                    postal_code: review.restaurant.postal_code,
                    street_address: review.restaurant.street_address,
                    price_rating: review.restaurant.price_rating,
                    logo: review.restaurant.logo
                }
            }
        end
    end

    def user_ratings
        self.ratings.order(created_at: :desc).map do |rating|
            # byebug
            {
                id: rating.id,
                rating: rating.number,
                dish: {
                    name: rating.dish.name,
                    description: rating.dish.description,
                    price: rating.dish.price,
                    restaurant: {
                        name: rating.dish.restaurant.name,
                        city: rating.dish.restaurant.city,
                        state: rating.dish.restaurant.state,
                        postal_code: rating.dish.restaurant.postal_code,
                        street_address: rating.dish.restaurant.street_address,
                        price_rating: rating.dish.restaurant.price_rating,
                        logo: rating.dish.restaurant.logo
                    }
                }
            }
        end
    end
end
