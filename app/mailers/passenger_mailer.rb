class PassengerMailer < ApplicationMailer
  default from: 'odinflights@gmail.com'

  def thank_you_email
    @passenger = params[:passenger]
    @booking = Booking.find(params[:id])
    @url  = booking_url(@booking)
    @flight = Flight.find(@booking.flight_id)
    mail(to: @passenger.email, subject: 'Confirmation of flight booking at OdinFlights')
  end
end
