class TripsController < ApplicationController
  def index
    @trips = Trip.all
  end

  def show
    id = params[:id]
    @trip = Trip.find(id)
  end

  def new
    if params[:passenger_id]
      passenger = Passenger.find_by(id: params[:passenger_id])
      @trip = passenger.trips.new
    else
      @trip = Trip.new
    end
  end

  def create
    @trip = Trip.new
    @trip.driver = Driver.first_available_driver
    @trip.passenger = Passenger.find_by(id: params[:passenger_id])
    @trip.driver.status = false
    @trip.driver.save

    @trip.date = Date.today
    @trip.cost = rand(1000..9999) 
    if @trip.save
      redirect_to passenger_path(@trip[:passenger_id])
    else
      render :new
    end
  end

  def edit
    @trip = Trip.find_by(id: params[:id])
  end

  def update
    @trip = Trip.find_by(id: params[:id])

    if @trip.update(trip_params)
      redirect_to trip_path(@trip.id)
    else
      render :edit
    end
  end

  def destroy
    @trip = Trip.find_by(id: params[:id])
    if @trip
      @trip.destroy
    end
    redirect_to trips_path
  end

  private

  def trip_params
    params.require(:trip).permit(:id, :date, :rating, :cost, :driver_id, :passenger_id)
  end
end
