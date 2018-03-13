class CreatePendingBookings < ActiveRecord::Migration[5.2]
  def change
    create_table :pending_bookings do |t|
      t.date        :date
      t.time        :start_time
      t.time        :end_time
      t.references  :doctor, foreign_key: true
      t.references  :user, foreign_key: true
      t.boolean     :bill
      t.string      :doc_recommendations

      t.timestamps
    end
  end
end
