class User < ActiveRecord::Base
  validates :device_id , presence: true
  # validates :gcm_registration_id , presence: true
  # validates :radius , presence: true
  has_many :posts
  has_many :posts_users
  has_many :seen_posts , through: :posts_users , source: :post
end
