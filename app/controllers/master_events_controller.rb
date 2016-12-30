class MasterEventsController < ApplicationController
  before_action :set_master_event, only: [ :show]


  def show
    @events = Event.where(master_event_id: @master_event)

  end

  private


  def set_master_event
    @master_event = MasterEvent.find(params[:id])
  end

end
