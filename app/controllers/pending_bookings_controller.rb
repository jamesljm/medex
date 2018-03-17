class PendingBookingsController < ApplicationController
  before_action :require_login
  @@param1 = 0
  before_action :define_instances, only: [:destroy]

  # schedule booking page 
  def new  
    @user = current_user
    @doctor_id = params[:doctor_id]
    @clinic = Clinic.find(params[:clinic_id])
  end

  # create pending booking
  def create
    @clinic = Clinic.find(params[:clinic_id])
    @pending_booking = PendingBooking.new(pending_booking_params)
    # TODO: calculate actual payment price AND shouldn't include the hidden field as it is hackable
    if @clinic.booking #booking = clinic's booking fee required
      @pending_booking.total_price = @clinic.fee
      @pending_booking.bill = false #bill - paid?
    else
      @pending_booking.bill = true
    end
    @pending_booking.patient_id = current_user.id
    @pending_booking.doctor_id = params[:doctor_id]
    
    if @pending_booking.save
      # to pass objects to partial @bookings#show
      @pending_bookings = PendingBooking.where('patient_id='+current_user.id.to_s)
      @bookings = Booking.where('patient_id=' + current_user.id.to_s)
      respond_to do |format|
        format.js
      end
    else
      flash[:notice] = "Failed to confirm..." 
    end
  end

  def destroy
    @pending_booking = PendingBooking.find(params[:id])

    @pending_booking.destroy
    respond_to do |format|
      format.js
    end
  end

  def clinic_selection
    @doctor_clinics = Doctor.find(params[:doctor_id]).clinics
    @doctor = Doctor.find(params[:doctor_id])
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












