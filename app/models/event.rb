require 'elasticsearch/model'

class Event < ActiveRecord::Base
	belongs_to :trial
	belongs_to :master_event
	include Elasticsearch::Model
	include Elasticsearch::Model::Callbacks

	def as_indexed_json(options = {})
	    as_json(:methods   => [ :search_keywords],
    				include: { trial: {include: { sport: {}}},
    						   master_event: {include: { organizer: {}}},
             })
	end

	def appendToKeyword(esKeywords, keyword)
		if keyword.to_s.empty?
			return esKeywords
		end
		return esKeywords.concat(keyword).concat(" ")
	end

	def search_keywords
		esKeywords = ""
		esKeywords = self.appendToKeyword(esKeywords, self.name)
		esKeywords = self.appendToKeyword(esKeywords, self.description)
		esKeywords = self.appendToKeyword(esKeywords, self.location)
		esKeywords = self.appendToKeyword(esKeywords, self.keywords)
		esKeywords = self.appendToKeyword(esKeywords, self.master_event.organizer.name)
		esKeywords = self.appendToKeyword(esKeywords, self.master_event.name)
		esKeywords = self.appendToKeyword(esKeywords, self.master_event.keywords)
		esKeywords = self.appendToKeyword(esKeywords, self.master_event.country)
		esKeywords = self.appendToKeyword(esKeywords, self.master_event.location)
		esKeywords = self.appendToKeyword(esKeywords, self.trial.name)
		esKeywords = self.appendToKeyword(esKeywords, self.trial.keywords)
		esKeywords = self.appendToKeyword(esKeywords, self.trial.description)
		esKeywords = self.appendToKeyword(esKeywords, self.trial.totalDistance.to_s)
		esKeywords = self.appendToKeyword(esKeywords, self.trial.sport.name)
		esKeywords = self.appendToKeyword(esKeywords, self.trial.sport.keywords)
		esKeywords = self.appendToKeyword(esKeywords, self.trial.sport.description)
        return esKeywords
    end

end

# Delete the previous articles index in Elasticsearch
Event.__elasticsearch__.client.indices.delete index: Event.index_name rescue nil

# Create the new index with the new mapping
Event.__elasticsearch__.client.indices.create \
  index: Event.index_name,
  body: { settings: Event.settings.to_hash, mappings: Event.mappings.to_hash }

Event.__elasticsearch__.refresh_index!

Event.import