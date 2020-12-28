class BookingsController < ApplicationController
    def new
        @booking = Booking.new(booking_params)
        @passengers = []
        (1..params[:num_tickets].to_i).each do |ticket|
            @passengers << Passenger.new()
        end
    end

    private

    def booking_params
        params.require(:booking).permit(:flight_id)
    end
end
