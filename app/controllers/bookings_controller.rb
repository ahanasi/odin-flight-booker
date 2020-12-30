require "pry"
class BookingsController < ApplicationController
    def new
      @booking = Booking.new
      @booking.flight = Flight.find(params[:booking][:flight_id])
      params[:num_tickets].to_i.times { @booking.passengers.build }
    end

    def create
      @booking = Booking.new(booking_params)
      if @booking.save
        flash[:success] = "Event successfully created!"
        redirect_to @booking
      else
        flash.now[:error] = "Your form could not be submitted. Please try again."
        render "new"
      end
    end

    def show
      @booking = Booking.find(params[:id])
    end

    private

    def booking_params
      params.require(:booking).permit(:flight_id, passengers_attributes:[:name, :email])
    end
end
