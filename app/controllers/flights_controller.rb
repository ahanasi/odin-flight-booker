class FlightsController < ApplicationController
  before_action :set_flight, only: [:show, :edit, :update, :destroy]

  # GET /flights
  # GET /flights.json
  def index
    @airport_options = Airport.all.map { |a| [a.name, a.id] }
    @date_options = Flight.pluck(:start_time).map { |f| [f.to_date.to_formatted_s(:rfc822), f.to_date] }.uniq
    @flights = Flight.search(params[:search])
  end

  def self.search(search)
    if search
      @flights = Flight.where(["from_airport_id = ? and to_airport_id = ? and DATE(start_time) = ?", search[:from_airport_id], search[:to_airport_id], search[:start_times]])
    else
      @flights = Flight.all
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_flight
    @flight = Flight.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def flight_params
    params.require(:flight).permit(:from_airport, :to_airport, :start_time, :duration, :search)
  end
end
