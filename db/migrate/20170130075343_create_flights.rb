class CreateFlights < ActiveRecord::Migration[5.0]
  def change
    create_table :flights do |t|
      t.integer :departure_id
      t.integer :arrival_id
      t.datetime :flight_time
      t.string :flight_duration

      t.timestamps
    end
  end
end
