require_relative '../uploader/images_uploader'

class Image < ActiveRecord::Base
  validates :url, presence: true, uniqueness: true
  mount_uploader :image, ImagesUploader
  belongs_to :user
end
