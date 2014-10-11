class WelcomeController < ApplicationController
  def index
    @events = Event.last(10)
    @photos = Photo.last(21)
  end
end
