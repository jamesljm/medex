class Booking < ApplicationRecord
  belongs_to  :doctor, foreign_key: "doctor_id", class_name: "Doctor"
  belongs_to  :patient, foreign_key: "patient_id", class_name: "Patient"
  has_one     :record
end
