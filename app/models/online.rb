class Online < ActiveRecord::Base
  mount_uploader :photo, PhotoUploader
  belongs_to :user
  has_many :messages
  has_many :photos

  validates :user_id, :title, presence: true

  def just_loaded_photos
    photos.where("message_id is NULL")
  end

end