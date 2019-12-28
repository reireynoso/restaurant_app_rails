class Dish < ApplicationRecord
    belongs_to :restaurant
    has_many :ratings

    def average_rating
        total = self.ratings.inject(0){|sum, rating| sum + rating.number}
        size = self.ratings.size
        if size == 0 
            0
        else
            # byebug
            (total.to_f/size.to_f).round(2)
        end
    end
end
