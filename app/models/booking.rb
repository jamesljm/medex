class Booking < ApplicationRecord
  belongs_to  :doctor, foreign_key: "doctor_id", class_name: "Doctor"
  belongs_to  :user
  has_one     :record
end
