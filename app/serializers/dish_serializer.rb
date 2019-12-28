class DishSerializer < ActiveModel::Serializer
  attributes :id, :name, :description, :price, :average_rating
  # def average_rating
    # # byebug
    # total = self.object.ratings.inject(0){|sum, rating| sum + rating.number}
    # size = self.object.ratings.size
    # if size == 0 

    # end
    # ( / ).to_f
  # end
end
