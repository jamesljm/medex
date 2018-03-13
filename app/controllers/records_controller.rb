class RecordsController < ApplicationController

  def new
    @record = Record.new
    @user=current_user
  end

  def create
    @record = Record.new(record_params)
  end
  
  def edit
  end
  
  def show
    
  end


  private
  def record_params
      params.require(:records).permit(:encounter)
  end
end
