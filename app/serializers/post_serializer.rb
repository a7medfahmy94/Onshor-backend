class PostSerializer < ActiveModel::Serializer
  attributes :id , :content , :number_of_shares , :number_of_ignores
  belongs_to :user
end
