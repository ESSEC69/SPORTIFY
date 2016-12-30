class SearchController < ApplicationController
  def index
  	if params[:q].present?
  		render plain: params[:q].inspect
  	else
  	end
  end

  def events
    @events = Event.all
    searchEvents = []
    @events.each do |event|
    	eventHash = event.attributes
    	eventHash['title'] = event.name
    	eventHash['start'] = event.startDate
    	eventHash['logo'] = ActionController::Base.helpers.image_tag("#{event.trial.sport_id}/logo.png", size: "14")
    	searchEvents.push(eventHash)
	end
    render json: searchEvents
  end
end