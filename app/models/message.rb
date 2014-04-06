class Message < ActiveRecord::Base
  belongs_to :user
  belongs_to :online
  validates :body, :user_id, :online_id, presence: true

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