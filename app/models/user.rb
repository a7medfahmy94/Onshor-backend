class User < ActiveRecord::Base
  validates :device_id , presence: true
  validates :gcm_registration_id , presence: true  
  has_many :posts
end
