class User < ActiveRecord::Base
  validates :device_id , presence: true
  validates :gcm_registration_id , presence: true  
  validates :radius , presence: true
  has_many :posts , through: :posts_users
  has_many :posts_users
end
