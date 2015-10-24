class Post < ActiveRecord::Base
  belongs_to :user
  has_many :posts_users
  has_many :user , through: :posts_users
  validates :content , presence: true
  validates_associated :user
end
