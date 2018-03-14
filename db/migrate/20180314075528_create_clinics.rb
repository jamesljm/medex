class CreateClinics < ActiveRecord::Migration[5.2]
  def change
    create_table :clinics do |t|
      t.string      :name
      t.string      :address
      t.string      :city
      t.string      :postcode
      t.string      :country
      t.string      :phone
      t.string      :email
      t.string      :operation_hour
      t.references  :doctor

      t.timestamps
    end
  end
end
