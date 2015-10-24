class UserSerializer < ActiveModel::Serializer
  attributes :id, :device_id, :number_of_shares , :number_of_ignores , :longitude, :latitude, :gcm_registration_id
  has_many :posts
  has_many :posts , through: :posts_users
  has_many :posts_userses
end
