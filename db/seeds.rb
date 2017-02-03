# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

airports = Airport.create([
	{code:"SFO", name: "San Franciso, CA"},
	{code:"LAX", name: "Los Angeles, CA"}, 
	{code:"SAL", name: "San Salvador, El Salvador"},
	{code:"SCPZ", name: "Base Antarctica, Antarctica"},  
	{code:"OST", name: "Oostende, Belgium"},
	{code:"PVG", name: "Shanghai, China"},
	{code:"QPH", name: "Palapye, Botswana"},
	{code:"MOON", name: "The Moon"}])

dates = []

5.times do 
	dates << (Faker::Date.forward(43))
end

def generate_date_and_time(date)
	Faker::Time.between(date.beginning_of_day, date.end_of_day, :afternoon)
end

# Generates 5 flights for each departure/arrival airport combination 
airports.each_with_index do |departure, departure_index|
	depart_id = departure_index + 1

	airports.each_with_index do |arrival, arrival_index|
		arr_id = arrival_index + 1
		next if depart_id == arr_id

		dates.each do |date|
			5.times do
			Flight.create!(
				departure_id: depart_id,
				arrival_id: arr_id,
				flight_duration: "#{rand(0..12)}hrs #{rand(0..59)} mins",
				flight_time: generate_date_and_time(date))
			end
		end
	end
end