class Adventure < ApplicationRecord
  geocoded_by :address
  after_validation :geocode          # this command auto fetches our coordinates
  has_many :comments
  belongs_to :user
  belongs_to  :category
  mount_uploader :picture, PictureUploader
end
