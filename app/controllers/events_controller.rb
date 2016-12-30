class EventsController < ApplicationController

  before_action :set_event, only: [ :show]

  def new
    @event = Event.new
  end

  def create
    @event = Event.new(event_params)

    @event.save
    @events = Sport.all
    render :index

  end

  def index
    @events = Event.all

  end

  def show
  end

  private

  def set_event
    if Event.all.exists?
    @event = Event.find(params[:id])
    else
    @event = "no event available"
    end
  end

  def event_params
    params.require(:event).permit(:name, :description, :startDate, :endDate, :location, :capacity, :trial_id, :master_event_id)
  end


end
