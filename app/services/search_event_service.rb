class SearchEventService

	def self.magicSearch(query)
		result = Hash.new
		result["month"] = nil
  		result["sport"] = nil
		month = DateHelper.extractMonth(query)
		range = DateHelper.extractRange(query)
		sportQuery = SportsHelper.extractSport(query)
		if !sportQuery.nil? and !range.nil?
			Rails.logger.debug "SearchEventService == SEARCH BY SPORT AND MONTH"
			Rails.logger.debug "SearchEventService > " + sportQuery.to_s
			Rails.logger.debug "SearchEventService GTE > " + range["gte"].to_s
			Rails.logger.debug "SearchEventService LTE > " + range["lte"].to_s
      		result["data"] = Event.search query: { bool: { must: [ {match: { "trial.sport.name": sportQuery}}, {range:  {"master_event.startDate"  => {gte: range["gte"].to_s, lte: range["lte"].to_s }}} ]}}
      		result["month"] = month
      		result["sport"] = sportQuery
      		result["type"] = "sport-date"
		elsif !sportQuery.nil?
			Rails.logger.debug "SearchEventService == SEARCH BY SPORT"
			Rails.logger.debug "SearchEventService > " + sportQuery.to_s
      		result["data"] = Event.search query: { match: { "trial.sport.name": sportQuery}}
      		result["sport"] = sportQuery
      		result["type"] = "sport"
		elsif !range.nil?
			Rails.logger.debug "SearchEventService == SEARCH BY MONTH"
			Rails.logger.debug "SearchEventService GTE > " + range["gte"].to_s
			Rails.logger.debug "SearchEventService LTE > " + range["lte"].to_s
      		result["data"] = Event.search query: { range:  {"master_event.startDate"  => {gte: range["gte"].to_s, lte: range["lte"].to_s }}}
      		result["month"] = month
      		result["type"] = "date"
		else
			Rails.logger.debug "SearchEventService > " + query
      		result["data"] = Event.search query: { match:  { search_keywords: query } }
      		result["type"] = "classic"
		end
      	return result
	end

	def self.formatSearch()
      monthlyCalendar = Hash.new
      response.results.each do |event|
        unless event.nil? || event == 0
          eventHash = DisplayEventService.generate(event._source)
          Rails.logger.info JSON.dump(eventHash)

          if !monthlyCalendar.key?(eventHash["month"])
            monthlyCalendar[eventHash["month"]] = []
          end

          monthlyCalendar[eventHash["month"]].push(eventHash)
        end
      end
      return monthlyCalendar
	end

	def self.magicSearchHash(query)
		response = Hash.new
		result = self.magicSearch(query)
		if result["type"] == "date" or result["type"] == "sport-date"
			response["data"] = DisplayEventService.generateByDate(result["data"])
		else
			response["data"] = DisplayEventService.generateClassic(result["data"])
		end
		response["type"] = result["type"]
		return response
	end

	def self.magicSearchHTML(query)
		response = Hash.new
		result = self.magicSearch(query)
		if result["type"] == "date" or result["type"] == "sport-date"
			data = DisplayEventService.generateByDate(result["data"])
			response["count"] = data.size
		else
			data = DisplayEventService.generateClassic(result["data"])
			response["count"] = data.keys.size
		end
		response["type"] = result["type"]
      	Rails.logger.info JSON.dump(data)
		ac = EventsController.new()
		response["html"] = ac.render_to_string(:action => "search_list", :layout => false, :locals => {:data => data, :type => response["type"], :sport => result["sport"], :month => result["month"]})
		return response
	end

end