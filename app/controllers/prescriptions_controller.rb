class PrescriptionsController < ApplicationController
  before_action :require_login, except: :create
  before_action :find_record_with_id, only: [:new, :create, :edit, :update, :show, :destory]
  before_action :find_presciption_with_id, only: [:edit, :update, :show, :destroy]
  
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
  end

  def create
    @user = current_user
    @prescription = Prescription.new(prescription_params)
    @prescription.record_id = params[:record_id]
    if @prescription.save
      render record_prescriptions_path(@record) 
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
  end

  def delete
  end

  private
  def prescription_params
    params.require(:prescription).permit(:drug_name, :dosage) 
  end

  def find_record_with_id
    @record = Record.find(params[:record_id])
  end

  def find_prescription_with_id
    @prescription = Prescription.find(params[:prescription_id])
  end

end
