class CreateGuests < ActiveRecord::Migration[5.2]
  def change
    create_table :guests do |t|
      t.string :name
      t.belongs_to :user
      t.boolean :rsvp

    end
  end
end
