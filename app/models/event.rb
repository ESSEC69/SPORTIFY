class Event < ActiveRecord::Base
  belongs_to :trial
  belongs_to :master_event
end
