class CreateVenues < ActiveRecord::Migration[5.2]
  def change
    create_table :venues do |t|
      t.string :name
      t.string :address
      t.belongs_to :event
    end
  end
end
