class Post < ActiveRecord::Base
  belongs_to :user
  has_many :posts_users
  has_many :users , through: :posts_users
  validates :content , presence: true
  validates :user_id , presence: true
  validates_associated :user

  after_create :publish_post


  private

  def publish_post
    users = User.pluck(:id)
    Pusher.trigger(users.map(&:to_s), 'new_post', {
      message: self.as_json
    })
  end
end
