class DropPassengers < ActiveRecord::Migration[5.0]
  def change
    drop_table :passengers
  end
end
