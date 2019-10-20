class CreateGuests < ActiveRecord::Migration[6.0]
  def change
    create_table :guests do |t|
      t.string :name
      t.belongs_to :event
      t.boolean :rsvp

    end
  end
end
