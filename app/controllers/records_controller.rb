class RecordsController < ApplicationController
  
  before_action :require_login, only: [:create, :edit, :update, :destroy]
  before_action :set_listing, only: [:edit, :update, :destroy]

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
    redirect_to record_path
  end
  
  def show
    @record = current_user.records
    @user=current_user
    
    
  end

  def index
    @records = current_user.records
    respond_to do |format|
      format.js
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
