class UserSerializer < ActiveModel::Serializer
  attributes :id, :username, :photo_url
end
