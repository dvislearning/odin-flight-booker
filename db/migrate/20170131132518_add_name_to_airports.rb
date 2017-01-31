class AddNameToAirports < ActiveRecord::Migration[5.0]
  def change
    add_column :airports, :name, :string
  end
end
