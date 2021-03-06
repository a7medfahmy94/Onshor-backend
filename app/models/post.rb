class Post < ActiveRecord::Base
  enum priority: [:high, :medium, :low]
  belongs_to :user
  has_many :posts_users
  has_many :users , through: :posts_users
  validates :content , presence: true
  validates :user_id , presence: true
  validates_associated :user

  after_create :publish_own_post, unless: :reply?
  after_create :reply, if: :reply?
  before_create :set_defaults



  def publish_post(origin)
    km = ENV["NORMAL_USER_CIRCLE"].to_f
    users = unseen_users
    circle = users.within(km, origin: origin)
    puts "*********SENDING TO********"
    puts "***************************"
    puts circle.inspect
    puts "***************************"
    puts "***************************"
    unless circle.empty?
      circle.each do |user|
        push(user.device_id,origin.id)
        self.posts_users << PostsUser.create(user: user)
      end
    end
  end

private
  def push(ch,id)
    begin
      Pusher.trigger(ch, 'new_post', {
        message:  ActiveModel::SerializableResource.new(self,{serializer: PostSerializer}).as_json.merge({publisher: id})
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
    blocking_users = Blocking.where(user_two: user.id).map(&:user_one)
    User.where.not(id: user_ids + [user_id] + blocking_users)
  end

  def set_defaults
    self.number_of_shares = 0
    self.number_of_ignores = 0
  end

  def reply?
    !reply_to.nil?
  end

  def reply
    receiver_device_id = User.find(reply_to).device_id
    push(receiver_device_id, user.id)
  end

end
