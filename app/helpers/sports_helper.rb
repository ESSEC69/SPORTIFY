module SportsHelper
	def self.extractSport(query)
		@sports = Sport.select(:name).distinct
		@sports.each do |sport|
			if query.downcase.include? sport.name.downcase
				return sport.name.downcase
			end
		end
		return nil
	end
end
