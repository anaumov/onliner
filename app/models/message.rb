class Message < ActiveRecord::Base
  belongs_to :user
  belongs_to :online
end