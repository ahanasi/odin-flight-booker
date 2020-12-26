require "pry"
class FlightsController < ApplicationController

  # GET /flights
  # GET /flights.json
  def index
    @airport_options = Airport.all.map { |a| [a.name, a.id] }
    @date_options = Flight.order(start_time: :asc).map { |f| [f.start_time.to_date.to_formatted_s(:rfc822), f.start_time.to_s] }.uniq{ |d| d[0]}
    if params[:flight]
      @flight = Flight.new(flight_params)
      flight_params.reject!{|_, v| v.blank?}
      @flights = Flight.search(flight_params)
    else 
      @flight = Flight.new
    end
  end

  private

  # Only allow a list of trusted parameters through.
  
  def flight_params
    params.require(:flight).permit(:from_airport_id, :to_airport_id, :start_time, :num_tickets)
  end
end
