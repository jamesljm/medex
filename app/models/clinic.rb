class Clinic < ApplicationRecord
  belongs_to :doctor

  accepts_nested_attributes_for :operation_hour, allow_destroy: true

  before_save :update_operation_hour

  def update_operation_hour

  end


end
