class CreatePrescriptions < ActiveRecord::Migration[5.2]
  def change
    create_table :prescriptions do |t|
      t.references :record, foreign_key: true
      t.string :drug_name

      t.timestamps
    end
  end
end
