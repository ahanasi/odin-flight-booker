class AlterFlightForInterval < ActiveRecord::Migration[5.2]
  def change
    execute "ALTER DATABASE odin-flight-booker_development SET IntervalStyle = 'iso_8601'"
  end
end
