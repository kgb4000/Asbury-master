class CreateChurchEvents < ActiveRecord::Migration
  def change
    create_table :church_events do |t|
      t.date :event_date
      t.string :event_name
      t.string :event_description
      t.time :event_time
      t.string :event_location

      t.timestamps null: false
    end
  end
end
