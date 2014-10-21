class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?

  def app_online_path online
    -# TODO кривой роутинг http://localhost:3000/onlines/1?username=anaumov
    online_path(username: online.user.username, id: online.id)
  end

  def event_path(event)
    event_date_slug_path(date: event.created_at.strftime("%d-%m-%Y"), slug: event.slug)
  end

protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) << :username
  end
end
