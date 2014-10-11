class MessagesController < ApplicationController

  def create
    @message = Message.new(permitted_params[:message])

    if @message.save
      assign_photos_for(@message) if params[:photos_ids]
      render :single_message, layout: false
    else
      render json: {errors: @message.all_errors}
    end
  end

  def latest_for_online
    @messages = Message.where(online_id: params[:online_id]).where('id > ?', params[:last_message_id])
    render :latest_for_online, layout: false
  end

private
  def assign_photos_for message
    photos = Photo.find(params[:photos_ids])
    photos.each {|photo| photo.update_attributes(message_id: @message.id)}
  end

  def permitted_params
    params.permit!
  end
end