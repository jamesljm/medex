class PendingBookingsController < ApplicationController
  before_action :require_login

  # schedule booking page 
  def new  
    @user = current_user
    @doctor_id = params[:doctor_id]
    @clinic = Clinic.find(params[:clinic_id])
  end

  # create pending booking
  def create
    @pending_booking = PendingBooking.new(pending_booking_params)
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
      render 'new'
    end
  end

  def destroy
    @pending_booking = PendingBooking.find(params[:id])
    @pending_booking.destroy
    if current_user.type == 'Patient'
      redirect_to patient_path(current_user.id)
    elsif current_user.type == 'Doctor'
      redirect_to doctor_path(current_user.id) 
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
end












