module DateHelper
	MONTH_REGEX = /.*(janvier|fevrier|mars|avril|mai|juin|juillet|aout|septembre|octobre|novembre|decembre).*/

	def self.extractMonth(query)
		if !query.scan(MONTH_REGEX).last.nil?
			return query.scan(MONTH_REGEX).last.first
		end
		return nil
	end

	def self.extractRange(query)
		month = self.extractMonth(query).to_s
		Rails.logger.debug "DateHelper > " + month
		return self.getMonthRanges(month)
	end

	def self.getMonthRanges(month)
		range = Hash.new
		if month == "janvier"
			range["gte"] = "2017-01-01"
			range["lte"] = "2017-01-31"
		elsif month =="fevrier"
			range["gte"] = "2017-02-01"
			range["lte"] = "2017-02-30"
		elsif month =="mars"
			range["gte"] = "2017-03-01"
			range["lte"] = "2017-03-31"
		elsif month =="avril"
			range["gte"] = "2017-04-01"
			range["lte"] = "2017-04-30"
		elsif month =="mai"
			range["gte"] = "2017-05-01"
			range["lte"] = "2017-05-31"
		elsif month =="juin"
			range["gte"] = "2017-06-01"
			range["lte"] = "2017-06-30"
		elsif month =="juillet"
			range["gte"] = "2017-07-01"
			range["lte"] = "2017-07-31"
		elsif month =="aout"
			range["gte"] = "2017-08-01"
			range["lte"] = "2017-08-31"
		elsif month =="septembre"
			range["gte"] = "2017-09-01"
			range["lte"] = "2017-09-30"
		elsif month =="octobre"
			range["gte"] = "2017-10-01"
			range["lte"] = "2017-10-31"
		elsif month =="novembre"
			range["gte"] = "2017-11-01"
			range["lte"] = "2017-11-30"
		elsif month =="decembre"
			range["gte"] = "2017-12-01"
			range["lte"] = "2017-12-31"
		else
			return nil
		end
		return range
	end
end
