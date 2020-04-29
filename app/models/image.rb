class Image < ApplicationRecord
  belongs_to :user

  has_one_attached :image
  has_many :likes
  validates :image, attached: true, content_type: %w(image/jpg image/jpeg image/png)

  
end
