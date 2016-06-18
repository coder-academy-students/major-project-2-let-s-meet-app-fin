class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.belongs_to :user, index: true, foreign_key: true
      t.string :location_place_id
      t.datetime :start_date_time
      t.datetime :end_date_time
      t.text :message

      t.timestamps null: false
    end
  end
end
