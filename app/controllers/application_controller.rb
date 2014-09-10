class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def app_online_path online
    online_path(username: online.user.username, id: online.id)
  end

  def event_path(event)
    event_date_slug_path(date: event.created_at.strftime("%d-%m-%Y"), slug: event.slug)
  end

end
