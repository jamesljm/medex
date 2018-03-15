class CreateOperationHours < ActiveRecord::Migration[5.2]
  def change
    create_table :operation_hours do |t|
      
      t.text    :mon
      t.text    :tue
      t.text    :wed
      t.text    :thu
      t.text    :fri
      t.text    :sat
      t.text    :sun
      t.text    :hol
      t.belongs_to :clinic, index: true

      t.timestamps
    end
  end
end
