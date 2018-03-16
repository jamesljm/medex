class Record < ApplicationRecord
  belongs_to  :booking, optional: true
  belongs_to  :patient, foreign_key: "patient_id", class_name: "Patient"
  has_many    :authorizations
  has_many     :prescriptions, dependent: :destroy
  has_many     :lab_tests
end
