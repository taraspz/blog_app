class Location < ApplicationRecord
  has_many :photos, dependent: :destroy
end
