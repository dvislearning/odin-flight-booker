class BookingsController < ApplicationController
  def new
  	@booking = Booking.new
  	@passenger_count = params[:passenger_count].to_i
    @passenger_count.times do 
      @booking.passengers.build
    end
    @flight = Flight.find_by(id: params[:flight_id])
  end

  def show
    @booking = Booking.find_by(id: params[:id])
    @flight =  @booking.flight
  end

  def create
    @booking = Booking.create!(booking_params)
    if @booking.save
      redirect_to booking_path(@booking)
      flash[:success] = "Booking created successfully"
    else
      @flight = Flight.find_by(id: params[:flight_id])
      @passenger_count = params[:passenger_count].to_i
      flash.now[:danger] = "Booking was not created"
      render 'new'
    end
  end

  def index
    redirect_to root_path
  end

  private

  def booking_params
    params.require(:booking).permit(:flight_id,
      :passengers_attributes => [:id, :name, :email])
  end 

end