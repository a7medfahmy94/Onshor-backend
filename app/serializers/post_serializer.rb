class PostSerializer < ActiveModel::Serializer
  attributes :id , :content , :number_of_shares , :number_of_ignores, :priority
  belongs_to :user
  has_many :posts_users
  has_many :users , through: :posts_users

  def priority
    Post.priorities[object.priority]
  end
end
