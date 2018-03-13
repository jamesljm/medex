class PendingBookingsController < ApplicationController
  before_action :require_login

  def new
    @user = current_user
  end

  def create
    render plain:params[:pending_booking].inspect
    @pending = PendingBooking.new(pending_booking_params)
    @pending.user_id=current_user.id
    p @pending
  end

  private
  def pending_booking_params
    params.require(:pending_booking).permit(:date, :start_time, :doctor_id, :patient_id)
  end
end












