class CreateFlights < ActiveRecord::Migration[5.2]
  def change
    create_table :flights do |t|
      t.string :from_airport
      t.string :to_airport
      t.datetime :start_time
      t.integer :duration

      t.timestamps
    end
  end
end
