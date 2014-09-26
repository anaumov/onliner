class WelcomeController < ApplicationController
  def index
    @events = Event.last(10)
    @users  = User.all.sample(10)
    @photos = Photo.last(20)
  end
end
