class LikesController < ApplicationController
  def create
    @like= Like.new(:doctor_id=> params[:param12], :patient_id=>current_user.id )
    checking= Like.where('patient_id='+current_user.id.to_s).where('doctor_id='+params[:param12].to_s)
    if checking.count == 0 
      if @like.save
        @doctor = Doctor.find(params[:param12])
        @like = Like.where('doctor_id='+params[:param12])
        respond_to do |format|
          format.js
        end
      else
        flash[:notice] = "Failed to Like..." 
      end
    end
    @doctor = Doctor.find(params[:param12])
    @like = Like.where('doctor_id='+params[:param12])
    respond_to do |format|
      format.js
    end
  end

  def index
    @like = Like.where('patient_id='+current_user.id.to_s).where('doctor_id='+params[:param13].to_s)
    if @like.destroy_all
      @doctor = Doctor.find(params[:param13])
      @like = Like.where('doctor_id='+params[:param13])
      respond_to do |format|
        format.js
      end
    else
      flash[:notice] = "Failed to UnLike..." 
    end
  end

  private
  def like_params
    params.require(:pending_booking).permit(:doctor_id, :patient_id)
  end

end