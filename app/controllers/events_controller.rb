class EventsController < ApplicationController
  inherit_resources

  def index
    @events = Event.all
  end

  def create
    @event = Event.new permitted_params[:event]
    if @event.save
      redirect_to event_path(@event)
    else
      render :new
    end
  end

  def show
    @event = Event.find_by_slug(permitted_params[:slug])
    @last_messages = @event.messages.first(10)
    @last_photos = @event.photos.last(20)
    @onlines = @event.onlines.page(params[:page]).per(5)
  end

  def events_by_date
    @events = Event.by_date(permitted_params[:date].to_datetime)
  end

private
  def permitted_params
    params.permit!
  end
end