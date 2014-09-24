class Message < ActiveRecord::Base
  belongs_to :user
  belongs_to :online
  belongs_to :event
  has_many :photos


  validates :body, :user_id, :online_id, presence: true

  scope :last_online_messages, -> (message, online_id){where("created_at > ?", message.created_at).where(online_id: online_id)}

  def all_errors
    errors.messages.map do |key, value|
      "#{ru_field(key)} #{value.join(', ')}"
    end.join(", ")
  end

private
  def ru_field field
    I18n.t("message.#{field}")
  end
end