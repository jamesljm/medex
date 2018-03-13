class ChangeStartTimeType < ActiveRecord::Migration[5.2]
  def change
    change_column :pending_bookings, :start_time, :string
  end
end
