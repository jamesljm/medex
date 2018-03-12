class AddColumnToRecords < ActiveRecord::Migration[5.2]
  def change
    add_reference :records, :patient, foreign_key: true
  end
end
