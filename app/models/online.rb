class Online < ActiveRecord::Base
  mount_uploader :photo, PhotoUploader
  belongs_to :user
  belongs_to :event
  has_many :messages

  validates :user_id, :title, presence: true
end