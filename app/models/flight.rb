class Flight < ApplicationRecord
  belongs_to :from_airport, class_name: "Airport", foreign_key: "from_airport_id"
  belongs_to :to_airport, class_name: "Airport", foreign_key: "to_airport_id"


  def self.search(search)
    if search
      @flights = Flight.where(["from_airport_id = ? and to_airport_id = ? and DATE(start_time) = ?", search[:from_airport_id], search[:to_airport_id], search[:start_time]])
    else
      @flights = Flight.all
    end
  end

end
