class Post < ActiveRecord::Base
  belongs_to :user
  has_many :posts_users
  has_many :users , through: :posts_users
  validates :content , presence: true
  validates :user_id , presence: true
  validates_associated :user

  after_create :publish_own_post

  def publish_post(origin)
    km = ENV["NORMAL_USER_CIRCLE"].to_f
    circle = User.within(km, origin: origin).pluck(:id)
    puts "*******************"
    puts circle.inspect
    puts km
    puts "*******************"
    unless circle.empty?
      Pusher.trigger(circle.map(&:to_s), 'new_post', {
        message: self.as_json
      })
    end
  end

  private

  def publish_own_post
    publish_post(user)
  end

end
