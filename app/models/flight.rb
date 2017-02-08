class Flight < ApplicationRecord
	belongs_to :departure, :class_name => "Airport"
	belongs_to :arrival, :class_name => "Airport"
	has_many :bookings

	def self.dates_available
		flight_times = Flight.all.order(flight_time: :asc).pluck(:flight_time)
		flight_times.map{ |n| [n.strftime("%m-%d-%Y") , n.strftime("%Y-%m-%d")] }.uniq
	end

	def self.flight_search(depart_id,arr_id,flight_date)
		  	Flight.where(
		  	departure_id: depart_id,
		  	arrival_id: arr_id,  
	  		flight_time: Flight.format_date(flight_date))
  	end

  	def self.format_date(flight_date)
  		unless flight_date.nil?
  			date = flight_date.to_date
  			date.beginning_of_day..date.end_of_day
  		end
  	end
end


