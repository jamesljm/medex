class ChangeBillColumnPendingBookings < ActiveRecord::Migration[5.2]
  def change
    change_column_default :pending_bookings, :bill, from: nil, to: false
  end
end
