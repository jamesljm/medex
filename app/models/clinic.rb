class Clinic < ApplicationRecord
  belongs_to :doctor

  store :operation_hour
  # has_one :operation_hour, dependent: :destroy

  # accepts_nested_attributes_for :operation_hour, allow_destroy: true
end
