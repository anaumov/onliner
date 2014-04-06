class My::MessagesController < ApplicationController
  def create
    @message = Message.new permitted_params[:message]
    @message.save!
    redirect_to my_online_path(@message.online)
  end

private
  def permitted_params
    params.permit!
  end
end