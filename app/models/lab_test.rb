class LabTest < ApplicationRecord
  belongs_to :record, foreign_key: "record_id", class_name: "Record"
end
