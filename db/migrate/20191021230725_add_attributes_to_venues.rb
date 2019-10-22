class AddAttributesToVenues < ActiveRecord::Migration[5.2]
  def change
    add_column :venues, :city, :string
    add_column :venues, :state, :string
    add_column :venues, :zip_code, :string
  end
end
