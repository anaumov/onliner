class WelcomeController < ApplicationController
  def index
    @onlines = Online.last(10)
    @photos = Photo.last(21)
  end
end
