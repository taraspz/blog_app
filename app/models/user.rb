class User < ApplicationRecord
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :photos,  dependent: :destroy

  has_many :followers, foreign_key: "user_id"
  has_many :followers, foreign_key: "follower_id"
end
