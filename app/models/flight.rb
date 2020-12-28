require "pry"
class Flight < ApplicationRecord
  belongs_to :from_airport, class_name: "Airport", foreign_key: "from_airport_id"
  belongs_to :to_airport, class_name: "Airport", foreign_key: "to_airport_id"
  has_many :bookings
  has_many :passengers, through: :bookings

  attr_accessor :num_tickets
  

  def self.search(search)
    if search
      flights = Flight.where(["DATE(start_time) = ?", search[:start_time]])
      flights = flights.where("from_airport_id = ?", search[:from_airport_id]) if search[:from_airport_id].present?
      flights = flights.where("to_airport_id = ?", search[:to_airport_id]) if search[:to_airport_id].present?   
      return flights.order(start_time: :asc)
    end
  end

  def format_date
    start_time.to_date.to_formatted_s(:rfc822)
  end
 
  def format_time(time_input)
    time_input.strftime("%I:%M %p")
  end

  def end_time
    start_time + duration.minutes
  end

  def formatted_duration
    hours = duration / 60
    rest = duration % 60
    (rest != 0) ? "#{hours} hr #{rest} min" : "#{hours} hr"
  end

end
