class ChangeBookingType < ActiveRecord::Migration[5.2]
  def change
    change_column :bookings, :date, :string
    change_column :bookings, :start_time, :string
  end
end
