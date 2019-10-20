class ChangeEventColumns < ActiveRecord::Migration[5.2]
  def up
    change_column(:events, :event_date, :string)
    change_column(:events, :start_time, :string)
    change_column(:events, :end_time, :string)
  end
  def down
    change_column(:events, :event_date, :datetime)
    change_column(:events, :start_time, :datetime)
    change_column(:events, :end_time, :datetime)
  end
end
