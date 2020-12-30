class Booking < ApplicationRecord
    belongs_to :flight
    has_many :passengers
    accepts_nested_attributes_for :passengers
    validates :flight_id, presence: true

    def formatted_date
        flight.start_time.strftime("%a, %B  %d, %Y")
    end

    def random_flight
      rand.to_s[2..5] 
    end

    def start_day
      flight.start_time.strftime("%a, %b  %d")
    end

    def end_day
      flight.end_time.strftime("%a, %b  %d")
    end
end
