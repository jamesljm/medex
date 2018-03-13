class Record < ApplicationRecord
  belongs_to  :booking
  has_many    :authorizations
  has_one     :prescription
  has_one     :lab_test

end
