class CreateGuestsEventsJoinTable < ActiveRecord::Migration[5.2]
  def change
    create_table :rsvps do |t|
      t.string :attending
      t.belongs_to :event
      t.belongs_to :guest

    end
  end
end
