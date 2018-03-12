class CreateHealths < ActiveRecord::Migration[5.2]
  def change
    create_table :healths do |t|
      t.date        :date
      t.float       :height
      t.float       :weight
      t.integer     :blood_pressure
      t.references  :patient
      t.timestamps
    end
  end
end
