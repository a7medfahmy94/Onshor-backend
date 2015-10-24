class PostsUserSerializer < ActiveModel::Serializer
  attributes :id , :action
  belongs_to :user
  belongs_to :post
end