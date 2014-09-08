class Photo < ActiveRecord::Base

  belongs_to :message
  belongs_to :online
  belongs_to :event

  mount_uploader :file, PhotoUploader

end