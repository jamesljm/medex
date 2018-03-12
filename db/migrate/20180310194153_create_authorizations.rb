class CreateAuthorizations < ActiveRecord::Migration[5.2]
  def change
    create_table :authorizations do |t|
      t.references :record, foreign_key: true
      t.references :doctor, foreign_key: true

      t.timestamps
    end
  end
end
