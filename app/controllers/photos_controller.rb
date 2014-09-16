class PhotosController < ApplicationController

  def create
    @photo = Photo.create(permitted_params[:photo])
  end

private
  def permitted_params
    params.permit!
  end
end