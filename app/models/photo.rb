class Photo < ApplicationRecord
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy
  belongs_to :user
  belongs_to :location

  include ImageUploader::Attachment(:image)
end
