class CreateEvents < ActiveRecord::Migration[5.2]
  def change
    create_table :events do |t|
      t.string :name
      t.string :event_date
      t.string :start_time
      t.string :end_time      
      t.belongs_to :user
      t.belongs_to :venue
    end
  end
end
