class TripsController < ApplicationController

    def index
      @trips = Trip.all
    end

    def show
      id = params[:id]
      @trip = Trip.find(id)
    end

    def new
      @trip = Trip.new
    end

    def create
      @trip = Trip.new(trip_params)

      if @trip.save
        redirect_to trips_path
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
