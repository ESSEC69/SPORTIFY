class DisplayEventService

	def self.generate(event)
		eventHash = Hash.new
		eventHash['name'] = event.name
		eventHash['master_event_name'] = event.master_event.name
		eventHash['link'] = Rails.application.routes.url_helpers.master_event_path(event.master_event.id)
		eventHash['distance'] = event.trial.totalDistance.to_s + " km"
		eventHash['location'] = event.master_event.location
		eventHash['sport'] = event.trial.sport.name

		if event.startDate.nil?
			eventHash['date'] = Date.parse(event.master_event.startDate)
			eventHash['month'] = eventHash['date'].strftime("%B")
		else
			eventHash['date'] = Date.parse(event.startDate)
			eventHash['month'] = eventHash['date'].strftime("%B")
		end

		@trial = Trial.find(event.trial_id)
		eventHash['logo'] = ActionController::Base.helpers.image_tag("#{@trial.sport_id}/logo.png", size: "14")
		return eventHash
	end

	def self.generateClassic(esEvents)
		monthlyCalendar = Hash.new
		esEvents.each do |event|
			unless event.nil? || event == 0
			  eventHash = self.generate(event._source)
			  Rails.logger.info JSON.dump(eventHash)

			  if !monthlyCalendar.key?(eventHash["month"])
			    monthlyCalendar[eventHash["month"]] = []
			  end

			  monthlyCalendar[eventHash["month"]].push(eventHash)
			end
		end
		return monthlyCalendar
	end

	def self.generateByDate(esEvents)
		result = []
		esEvents.each do |event|
			unless event.nil? || event == 0
			  result.push(self.generate(event._source))
			end
		end
		return result
	end

end