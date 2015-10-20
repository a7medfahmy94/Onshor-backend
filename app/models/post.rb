class Post < ActiveRecord::Base
  belongs_to :user
  validates :content , presence: true
  validates :number_of_ignores , presence: true
  validates :number_of_shares , presence: true
  validates_associated :user
end
