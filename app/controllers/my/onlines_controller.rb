class My::OnlinesController < ApplicationController
  def index
    @onlines = current_user.onlines
  end

  def create
    @online = Online.new permitted_params[:online]

    if @online.save!
      redirect_to my_online_path(@online)
    else
      render :new
    end
  end

  def new
    @online = Online.new(user_id: current_user.id)
  end

  def update
  end

  def show
    @online = Online.find params[:id]
    @message = current_user.messages.new(online_id: @online.id)
  end

private
  def permitted_params
    params.permit!
  end
end