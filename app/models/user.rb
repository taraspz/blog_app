class User < ApplicationRecord
    devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :username, presence: true, uniqueness: { case_sensitive: false }
  validates :first_name, presence: true
  validates :last_name, presence: true

  has_many :images
  has_many :likes

  def full_name
    [first_name, last_name].join(' ')
  end

  def total_followers
    Follower.where(follower_id: self.id).count
  end
  def total_following
    Follower.where(following_id: self.id).count
  end


end
