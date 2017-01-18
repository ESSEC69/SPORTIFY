class SearchEventService

	def self.magicSearch(query)
		# @sports = Sport.all
		monthlyQuery = DateHelper.containsMonth(query)
		if !monthlyQuery.nil?
			range = DateHelper.getMonthRanges(monthlyQuery.to_s)
      		# response = Event.search query: { range:  {"master_event.startDate"  => {gte: "2017-07-01", lte: "2017-07-30" }}}
      		response = Event.search query: { range:  {"master_event.startDate"  => {gte: range["gte"].to_s, lte: range["gte"].to_s }}}
		else
      		response = Event.search query: { match:  { search_keywords: query } }
		end
      	return response
	end

end