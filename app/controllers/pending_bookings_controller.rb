class PendingBookingsController < ApplicationController
  before_action :require_login
  @@param1 = 0

  def new
    @@param1 = params[:param1]
    @user = current_user
  end

  def create
    @pending_booking = PendingBooking.new(pending_booking_params)
    @pending_booking.patient_id = current_user.id
    @pending_booking.doctor_id = @@param1
    
    if @pending_booking.save
      # to pass objects to partial @bookings#show
      @pending_bookings = PendingBooking.where('patient_id='+current_user.id.to_s)
      @bookings = Booking.where('patient_id=' + current_user.id.to_s)
      respond_to do |format|
        format.js
      end
    else
      render 'new'
    end
  end

  def destroy
    @pending_booking = PendingBooking.find(params[:id])
    # @pending_booking.destroy
    if @pending_booking.destroy
      @pending_bookings = PendingBooking.where('patient_id='+current_user.id.to_s)
      @bookings = Booking.where('patient_id=' + current_user.id.to_s)
      respond_to do |format|
        format.js
      end
      # redirect_to patient_path(current_user.id)
    elsif current_user.type == 'Doctor'
      redirect_to doctor_path(current_user.id) 
    end
  end

  private
  def pending_booking_params
    params.require(:pending_booking).permit(:date, :start_time, :doctor_id, :patient_id)
  end
end












