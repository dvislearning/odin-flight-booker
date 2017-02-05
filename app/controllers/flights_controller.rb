class FlightsController < ApplicationController
  def index
  	@user_options = Airport.all.map{ |u| [ u.name, u.id ] }
  	@dates = Flight.dates_available
  	@arrival_id = params[:arrival_id]
  	@departure_id = params[:departure_id]
  	@travel_date = params[:travel_date]
  	@passenger_count = params[:passenger_count]

 	@flight_query = Flight.flight_search(
 		params[:departure_id],
 		params[:arrival_id],
  		params[:travel_date])

  	if params[:commit] == "Search"
  		if params[:departure_id] == params[:arrival_id]
  			flash[:danger] = "No flights found!"
  		end
  	end
  end
end
