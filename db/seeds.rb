# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


Airport.delete_all
Flight.delete_all

ActiveRecord::Base.connection.tables.each do |t|
  ActiveRecord::Base.connection.reset_pk_sequence!(t)
end

require "csv"

@sfo = Airport.create(name: "San Francisco – SFO")
@jfk = Airport.create(name: "New York – JFK")

csv_text = File.read(Rails.root.join("lib", "seeds", "flights.csv"))
csv = CSV.parse(csv_text, :headers => true, :encoding => "ISO-8859-1")
csv.each do |row|
  st = Time.zone.at(rand(Time.current..60.day.from_now))
  if row["From"] == "SFO"
      Flight.create(from_airport: @sfo, to_airport: @jfk, start_time: st, duration: row["Duration"])
  else
      Flight.create(from_airport: @jfk, to_airport: @sfo, start_time: st, duration: row["Duration"])
  end
end


