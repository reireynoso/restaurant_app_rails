class RestaurantSerializer < ActiveModel::Serializer
  attributes :id, :name, :city, :state, :postal_code, :street_address, :latitude,:longitude,:price_rating,:logo,:media_image, :dishes, :reviews
  has_many :dishes
  # has_many :reviews
  
  def reviews 
    #customized serializer for reviews to return serialized user
    self.object.reviews.order(created_at: :desc).map do |review| 
      {
        "id": review.id,
        "user": {
          id: review.user_id,
          username: User.find(review.user_id).username
        },
        "restaurant_id": review.restaurant_id,
        "comment": review.comment
      }
      # byebug
    end
  end 
end
