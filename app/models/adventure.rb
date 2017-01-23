class Adventure < ApplicationRecord
  has_many :comments
  mount_uploader :picture, PictureUploader
end
