class MessagesController < ApplicationController
  def create
    @message = Message.new permitted_params[:message]

    if @message.save
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
    params.permit!
  end
end