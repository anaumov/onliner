class OnlinesController < ApplicationController
  def index
    @onlines = current_user.onlines
  end

  def create
    @online = Online.new permitted_params[:online]

    if @online.save
      redirect_to app_online_path(@online)
    else
      render :new
    end
  end

  def new
    @online = current_user.onlines.build(event_id: params[:event_id])
  end

  def edit
    @online = Online.find params[:id]
  end

  def update
    @online = Online.find params[:id]

    if @online.update_attributes! permitted_params[:onlines]
      redirect_to online_path(username: @online.user.username, id: @online.id)
    else
      render :edit
    end
  end

  def show
    @online = Online.find params[:id]
  end

private
  def permitted_params
    params.permit!
  end
end