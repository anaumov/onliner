class My::MessagesController < ApplicationController
  def create
    @message = Message.new permitted_params[:message]

    if @message.save
      render :single_message, layout: false
    else
      render json: {errors: @message.all_errors}
    end
  end

private
  def permitted_params
    params.permit!
  end
end