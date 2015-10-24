class PostSerializer < ActiveModel::Serializer
  attributes :id , :content , :number_of_shares , :number_of_ignores
  belongs_to :user
  has_many :posts_userses
  has_many :users , through: :posts_users
end
