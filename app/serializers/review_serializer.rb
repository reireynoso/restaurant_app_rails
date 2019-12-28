class ReviewSerializer < ActiveModel::Serializer
  attributes :id, :user, :comment, :restaurant_id
  belongs_to :user
end
