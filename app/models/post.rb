class Post < ActiveRecord::Base
  belongs_to :user
  has_many :posts_users
  has_many :users , through: :posts_users
  validates :content , presence: true
  validates :user_id , presence: true
  validates_associated :user

  after_create :publish_own_post
  before_create :set_defaults

  def publish_post(origin)
    km = ENV["NORMAL_USER_CIRCLE"].to_f
    users = unseen_users
    circle = users.within(km, origin: origin).pluck(:device_id)
    unless circle.empty?
      circle.each do |ch|
        push(ch,origin.id)
      end
    end
  end

private

  def push(ch,id)
    begin
      Pusher.trigger(ch, 'new_post', {
        message: self.as_json.merge({publisher: id})
      })
    rescue Pusher::Error => e
      puts "*********************"
      puts "*********************"
      puts e.inspect
      puts "*********************"
      puts "*********************"
    end
  end

  def publish_own_post
    publish_post(user)
  end

  def unseen_users
    User.where.not(id: user_ids + [user_id])
  end

  def set_defaults
    self.number_of_shares = 0
    self.number_of_ignores = 0
  end

end
