class PostSerializer < ActiveModel::Serializer
  attributes :id , :content , :number_of_shares , :number_of_ignores, :priority, :user_id


  def priority
    Post.priorities[object.priority]
  end
end
