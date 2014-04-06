class Event < ActiveRecord::Base
  scope :current, -> {all}
  mount_uploader :photo, PhotoUploader

  has_many :onlines
end