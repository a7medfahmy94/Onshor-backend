class Post < ActiveRecord::Base
  belongs_to :user
  has_many :posts_userses
  has_many :users , through: :posts_users
  validates :content , presence: true
  validates :user_id , presence: true
  validates_associated :user
end
