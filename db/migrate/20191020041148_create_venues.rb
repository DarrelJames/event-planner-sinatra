class CreateVenues < ActiveRecord::Migration[6.0]
  def change
    create_table :events do |t|
      t.string :name
      t.string :address
      t.belongs_to :venue
    end
  end
end
