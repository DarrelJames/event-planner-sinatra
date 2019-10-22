class CreateGuestsEventsJoinTable < ActiveRecord::Migration[5.2]
  def change
    create_table :invitations, id: false do |t|
      t.belongs_to :event
      t.belongs_to :guest
      t.boolean :attending
    end
  end
end
