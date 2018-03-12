class Record < ApplicationRecord
  belongs_to  :booking
  belongs_to  :patient
  has_many    :authorizations
  has_many     :prescriptions
  has_many     :lab_tests
end
