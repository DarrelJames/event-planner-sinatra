class CreateEvents < ActiveRecord::Migration[5.2]
  def change
    create_table :events do |t|
      t.string :name
      t.datetime :event_date
      t.datetime :start_time
      t.datetime :end_time
      t.belongs_to :user
      t.belongs_to :venue
    end
  end
end
