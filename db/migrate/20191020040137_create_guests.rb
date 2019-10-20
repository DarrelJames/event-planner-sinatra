class CreateGuests < ActiveRecord::Migration
  def change
    create_table :guests do |t|
      t.string :name
      t.belongs_to :event
      t.boolean :rsvp

    end
  end
end
