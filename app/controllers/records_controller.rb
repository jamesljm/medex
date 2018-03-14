class RecordsController < ApplicationController
  
  before_action :require_login, only: [:create, :edit, :update, :destroy]
  before_action :set_record, only: [:edit, :update, :show, :destroy]

  def new
    @user=current_user
    @record = Record.new
  end

  def create
    @user=current_user
    @record = current_user.records.new(record_params)
    @record.patient_id = current_user.id
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
    redirect_to record_path, notice: "Your record has been updated."
  end
  
  def show
    @user=current_user  
  end

  def index
    @records = current_user.records
    respond_to do |format|
      format.js
    end
  end

  def destroy
    if current_user.type == "Doctor"
      redirect_to record_path, notice: "Sorry. You do not have the permission to delete this record."
    elsif current_user.type == "Patient"
      @listing = @listing.destroy
      redirect_to records_path, notice: "You have deleted #{@record.title} dated #{@record.record_date}"
    end
  end


  private
  def record_params
    params.require(:record).permit(:record_date, :title, :symptoms, :diagnosis, :note, :follow_up, :referral, :referral_note, {encounter: []} )
  end

  def set_record
    @record = Record.find(params[:id])
  end
end
