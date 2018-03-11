class CreateLabTests < ActiveRecord::Migration[5.2]
  def change
    create_table :lab_tests do |t|
      t.references :record, foreign_key: true
      t.string :test_name

      t.timestamps
    end
  end
end
