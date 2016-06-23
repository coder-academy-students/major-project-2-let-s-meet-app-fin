class AddLocationNameToEvent < ActiveRecord::Migration
  def change
    add_column :events, :location_name, :string
  end
end
