class PendingBookingsController < ApplicationController
  before_action :require_login
  @@param1 = 0
  before_action :define_instances, only: [:destroy]

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
    @pending_booking.destroy
    respond_to do |format|
      format.js
    end
  end

  private
  def pending_booking_params
    params.require(:pending_booking).permit(:date, :start_time, :doctor_id, :patient_id)
  end

  def define_instances
    if current_user.type == "Doctor"
      @pending_bookings_doc = PendingBooking.where('doctor_id='+current_user.id.to_s)
      @bookings_doc = Booking.where('doctor_id=' + current_user.id.to_s)   
    else 
      @pending_bookings = PendingBooking.where('patient_id='+current_user.id.to_s)
      @bookings = Booking.where('patient_id=' + current_user.id.to_s)
    end
  end
end












