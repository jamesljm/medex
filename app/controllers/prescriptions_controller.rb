class PrescriptionsController < ApplicationController
  before_action :require_login, except: :create
  before_action :find_record_with_id, only: [:index, :new, :create, :edit, :update, :show, :destory]
  before_action :find_prescription_with_id, only: [:edit, :update, :show, :destroy]
  
  def index
    # @records = current_user.records.all

    @prescriptions = []

    current_user.records.each do |record|
      @prescriptions << record.prescriptions
    end

    # @prescriptions = @records.prescriptions
    
    respond_to do |format|
      format.js
    end
  end

  def new
    @prescription = Prescription.new
    respond_to do |format|
      format.js
    end
  end

  def create
    @user = current_user
    @prescription = Prescription.new(prescription_params)
    @prescription.record_id = params[:record_id]
    if @prescription.save
      redirect_to patient_path(@user) 
    else 
      redirect_back(fallback_location: new_record_prescription_path)
      flash[:notice] = (@reservation.errors.full_messages)
    end  
  end

  def show
  end

  def edit
  end

  def update
    @prescription.update(prescription_params)
    redirect_to patient_path(current_user), :flash => {:success=> "Your record has been updated."}
  end

  def destroy
    @prescription.destroy
    if current_user.type == 'Patient'
      redirect_to patient_path(current_user.id), :flash => {:success=> "Your record has been deleted."}
    elsif current_user.type == 'Doctor'
      redirect_to doctor_path(current_user.id), :flash => {:success=> "Your record has been deleted."} 
    end

  end

  private
  def prescription_params
    params.require(:prescription).permit(:drug_name, :dosage, :pres_start_date, :pres_end_date, :meal, :morning, :noon, :night) 
  end

  def find_record_with_id
    @record = Record.find(params[:record_id])
  end

  def find_prescription_with_id
    @prescription = Prescription.find(params[:id])
  end

end
