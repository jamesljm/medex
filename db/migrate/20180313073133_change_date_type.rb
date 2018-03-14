class ChangeDateType < ActiveRecord::Migration[5.2]
  def change
    change_column :pending_bookings, :date, :string
  end
end
