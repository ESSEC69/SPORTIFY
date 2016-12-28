class EventsController < ApplicationController

  before_action :set_event, only: [ :show]

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


end
