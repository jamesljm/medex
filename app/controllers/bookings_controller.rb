class BookingsController < ApplicationController
  protect_from_forgery except: :show
  before_action :require_login
  @@param2 = 0

  def new
    @user = current_user
  end

  def show
    @pending_bookings_doc = PendingBooking.where('doctor_id='+current_user.id.to_s)
    @bookings_doc = Booking.where('doctor_id=' + current_user.id.to_s)    
    @pending_bookings = PendingBooking.where('patient_id='+current_user.id.to_s)
    @bookings = Booking.where('patient_id=' + current_user.id.to_s)
    respond_to do |format|
      format.js
    end
  end

  def create
    @@param2 = params[:param2]
    @pending_booking = PendingBooking.find(@@param2)
    @booking = Booking.new(:date=>@pending_booking.date, :start_time=>@pending_booking.start_time, :doctor_id=>@pending_booking.doctor_id, :patient_id=>@pending_booking.patient_id) 
    
    if @booking.save
      @pending_booking.destroy
      
    else
      flash[:notice] = "Failed to confirm..." 
    end

    respond_to do |format|
      format.js
    end

  end

  def destroy
    @booking = Booking.find(params[:id])
    @booking.destroy
    if current_user.type == 'Patient'
      redirect_to patient_path(current_user.id)
    elsif current_user.type == 'Doctor'
      redirect_to doctor_path(current_user.id) 
    end
  end

  private
  def booking_params
    params.require(:booking).permit(:date, :start_time, :doctor_id, :patient_id)
  end
end
