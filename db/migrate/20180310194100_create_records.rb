class CreateRecords < ActiveRecord::Migration[5.2]
  def change
    create_table :records do |t|
      t.string :prescription
      t.date :record_date
      t.references :booking, foreign_key: true
      t.string :referral
      t.string :note
      t.string :consultation_type

      t.timestamps
    end
  end
end
