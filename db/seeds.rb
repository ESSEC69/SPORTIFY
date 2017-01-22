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




#### SPORTS #####
triathlon = Sport.new(name: 'Triathlon', description: 'Nager Rouler Courir')
swimrun = Sport.new(name: 'Swim & Run', description: 'Nager & Rouler')
running = Sport.new(name: 'Running', description: 'Courir')
cyclocross = Sport.new(name: 'Cyclocross', description: 'Le vélo mais dans la boue')
raid = Sport.new(name: 'Raid multisport', description: "Esprit d'équipe")
bikerun = Sport.new(name: 'Bike & Run', description: 'Courir et Rouler')
cyclisme = Sport.new(name: 'Vélo de route', description: 'Un parfum de Tour de France')
trail = Sport.new(name: 'Trail', description: 'Courir la montagne')

triathlon.save!
swimrun.save!
running.save!
cyclocross.save!
raid.save!
bikerun.save!
cyclisme.save!
trail.save!





#### TRIALS #####
triathlonXs = Trial.new(name: 'Triathlon XS', sport_id: "#{triathlon.id}", totalDistance: "30", description: "Triathlon de très courte distance", level: "1")
triathlonXs.save!
triathlonS = Trial.new(name: 'Triathlon S', sport_id: "#{triathlon.id}", totalDistance: "50", description: "Triathlon de courte distance", level: "2")
triathlonS.save!
triathlonM = Trial.new(name: 'Triathlon M', sport_id: "#{triathlon.id}", totalDistance: "100", description: "Triathlon de distance moyenne", level: "3")
triathlonM.save!
triathlonL = Trial.new(name: 'Triathlon L', sport_id: "#{triathlon.id}", totalDistance: "100", description: "Triathlon de longue distance", level: "4")
triathlonL.save!
halfIM = Trial.new(name: 'Ironman 70.5', sport_id: "#{triathlon.id}", totalDistance: "100", description: "Ironman 70.5 (half-ironman)", level: "3")
halfIM.save!
fullIM = Trial.new(name: 'Ironman', sport_id: "#{triathlon.id}", totalDistance: "200", description: "Ironman", level: "4")
fullIM.save!
dixkm = Trial.new(name: '10 km', sport_id: "#{running.id}", totalDistance: "10", description: "10KM", level: "1")
dixkm.save!
semi = Trial.new(name: 'Semi-marathon', sport_id: "#{running.id}", totalDistance: "21.5", description: "Semi-marathon", level: "3")
semi.save!
marathon = Trial.new(name: 'Marathon', sport_id: "#{running.id}", totalDistance: "42.12", description: "Marathon", level: "4")
marathon.save!


#### ORGANIZERS #####
oxyrace = Organizer.new(name:"Oxyrace")
oxyrace.save!
aintriman = Organizer.new(name:"Aintriman")
aintriman.save!
aso = Organizer.new(name:"ASO Challenge")
aso.save!




aintrimantri = MasterEvent.new(name:"Aintriman", startDate:"12/07/2017", endDate:"13/07/2017", country: "France", location: "Nantua", organizer_id:"#{aintriman.id}")
aintrimantri.save!

triathlondurevermont = MasterEvent.new(name:"Oxyrace Triathlon du Revermont", startDate:"12/07/2017", endDate:"13/07/2017", country: "France", location: "Treffort-Cuisiat", organizer_id:"#{oxyrace.id}")
triathlondurevermont.save!

epreuve1 = Event.new(name: "Cross triathlon XS", trial_id:triathlonXs.id, startDate:"12/07/2017", endDate:"12/07/2017", location:triathlondurevermont.location, capacity: "150", master_event_id:triathlondurevermont.id)
epreuve1.save!

epreuve2 = Event.new(name: "Cross triathlon S", trial_id:triathlonS.id, startDate:"12/07/2017", endDate:"12/07/2017", location:triathlondurevermont.location, capacity: "150", master_event_id:triathlondurevermont.id)
epreuve2.save!

epreuve3 = Event.new(name: "Cross triathlon M", trial_id:triathlonM.id, startDate:"12/07/2017", endDate:"12/07/2017", location:aintrimantri.location, capacity: "150", master_event_id:aintrimantri.id)
epreuve3.save!
