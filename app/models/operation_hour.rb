class OperationHour < ApplicationRecord
  belongs_to :clinic

  before_save :update_operation_hour

end
