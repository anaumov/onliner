class Photo < ActiveRecord::Base

  belongs_to :message
  mount_uploader :file, PhotoMessageUploader

end