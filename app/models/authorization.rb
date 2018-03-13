class Authorization < ApplicationRecord
  belongs_to :record, foreign_key: "record_id", class_name: "Record"
  belongs_to :doctor, foreign_key: "doctor_id", class_name: "Doctor"
end
