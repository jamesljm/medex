class CreateBookings < ActiveRecord::Migration[5.2]
  def change
    create_table :bookings do |t|
      t.date        :date
      t.time        :start_time
      t.time        :end_time
      t.references  :doctor
      t.references  :patient
      t.boolean     :bill
      t.string      :doc_recommendations

      t.timestamps
    end
  end
end
