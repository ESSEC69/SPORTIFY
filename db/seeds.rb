# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
Event.destroy_all
MasterEvent.destroy_all
Trial.destroy_all
Sport.destroy_all
Organizer.destroy_all






triathlon = Sport.new(name: 'Triathlon', description: 'Nager Rouler Courir')
duathlon = Sport.new(name: 'Duathlon', description: 'Rouler Courir')
running = Sport.new(name: 'Running', description: 'Courir')
triathlon.save!
duathlon.save!
running.save!

xs = Trial.new(name: 'Triathlon XS', sport_id: "#{triathlon.id}", totalDistance: "30", description: "distance courte", level: "1")
xs.save!

s = Trial.new(name: 'Triathlon S', sport_id: "#{triathlon.id}", totalDistance: "50", description: "distance normale", level: "2")
s.save!

m = Trial.new(name: 'Triathlon M', sport_id: "#{triathlon.id}", totalDistance: "100", description: "distance moyenne", level: "3")
m.save!

dixkm = Trial.new(name: '10 km', sport_id: "#{running.id}", totalDistance: "10", description: "distance courte", level: "1")
dixkm.save!


oxyrace = Organizer.new(name:"O'xyrace")
oxyrace.save!

aintriman = Organizer.new(name:"Aintriman")
aintriman.save!

aintrimantri = MasterEvent.new(name:"Aintriman", startDate:"12/07/2017", endDate:"13/07/2017", country: "France", location: "Nantua", organizer_id:"#{aintriman.id}")
aintrimantri.save!

triathlondurevermont = MasterEvent.new(name:"Oxyrace Triathlon du Revermont", startDate:"12/07/2017", endDate:"13/07/2017", country: "France", location: "Treffort-Cuisiat", organizer_id:"#{oxyrace.id}")
triathlondurevermont.save!

epreuve1 = Event.new(name: "Cross triathlon XS", trial_id:xs.id, startDate:"12/07/2017", endDate:"12/07/2017", location:triathlondurevermont.location, capacity: "150", master_event_id:triathlondurevermont.id)
epreuve1.save!

epreuve2 = Event.new(name: "Cross triathlon S", trial_id:s.id, startDate:"12/07/2017", endDate:"12/07/2017", location:triathlondurevermont.location, capacity: "150", master_event_id:triathlondurevermont.id)
epreuve2.save!

epreuve3 = Event.new(name: "Cross triathlon M", trial_id:m.id, startDate:"12/07/2017", endDate:"12/07/2017", location:aintrimantri.location, capacity: "150", master_event_id:aintrimantri.id)
epreuve3.save!
