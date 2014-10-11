class PhotosController < ApplicationController

  def create
    @photo = Photo.create(permitted_params[:photo])
  end

  def index
    @photos = Photo.last(300)
  end

private
  def permitted_params
    params.permit!
  end
end