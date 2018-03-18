class AddAuthorizationCodeToRecords < ActiveRecord::Migration[5.2]
  def change
    add_column :records, :authorization_code, :string
  end
end
