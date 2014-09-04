class MessagesController < ApplicationController

  def show
    @photos = @message.photos.all
    super
  end

  def new
   @message = Message.new
   @photo = @message.photos.build
  end

  def create
    @message = Message.new(permitted_params)

    if @message.save
      params[:photos]['file'].each do |f|
        @photo = @message.photos.create(:file => f, :message_id => @message.id)
       end
      render :single_message, layout: false
    else
      render json: {errors: @message.all_errors}
    end
  end

  def last_messages
    last_viewed_message = Message.find params[:last_message_id]
    @messages = Message.last_online_messages(last_viewed_message, params[:online_id])
    render layout: false
  end

private
  def permitted_params
    params.require(:message).permit(:body, photos_attributes: [:id, :message_id, :file])
  end
end