class Event < ActiveRecord::Base

  after_create :convert_title_to_slug

  scope :current, -> {all}
  scope :by_date, ->(date) { where(created_at: date.beginning_of_day..date.end_of_day) }

  mount_uploader :photo, PhotoUploader

  has_many :onlines
  has_many :photos
  has_many :messages, through: :onlines

private
  def convert_title_to_slug
    self.update_attributes(slug: title.to_lat)
  end

end