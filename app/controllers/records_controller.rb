class RecordsController < ApplicationController
  
  before_action :require_login, only: [:create, :edit, :update, :destroy]
  before_action :set_record, only: [:edit, :update, :destroy]
  @@param3 = 0

  def new
    @user=current_user
    @record = Record.new
    if @user.type == "Doctor"
      @@param3 = params[:param3]
      @booking = Booking.find(@@param3)

    end

    respond_to do |format|
      format.js
    end
  end

  def create
    @user=current_user
    if @user.type == "Doctor"
            
      @booking = Booking.find(@@param3)
      @patient = Patient.find(@booking.patient_id)
      @record = @patient.records.new(record_params)
      @record.booking_id = @booking.id
      @record.patient_id = @patient.id
    else  
      @record = current_user.records.new(record_params)
      @record.patient_id = current_user.id
    end
    
    if @record.save
      if @user.type == "Doctor"
        redirect_to doctor_path(@user.id)
      else 
        redirect_to patient_path(@user.id)
      end
    else
        redirect_back(fallback_location: new_record_path)
    end
  end
  
  def edit

  end

  def update
    @record = @record.update(record_params)
    # redirect_to record_path, notice: "Your record has been updated."
    respond_to do |format|
      format.js
    end
  end
  
  def show
    
    @user = current_user
    @records = current_user.records
    @record = Record.new
    
    respond_to do |format|
      format.js
    end
  end

  def index

  end

  def destroy
    @record.destroy
    if current_user.type == 'Patient'
      redirect_to patient_path(current_user.id)
    elsif current_user.type == 'Doctor'
      redirect_to doctor_path(current_user.id) 
    end
  end

  def doctor
    @doctor = Doctor.find(params[:id])
    @@param3 = params[:param3]
    @booking = Booking.find(@@param3)
    
    @records = @booking.record
    respond_to do |format|
      format.js
    end

  end

private
  def record_params
    params.require(:record).permit(:booking_id, :record_date, :title, :symptoms, :diagnosis, :note, :follow_up, :referral, :referral_note, {encounter: []} )
  end

  def set_record
    @record = Record.find(params[:id])
  end
end
