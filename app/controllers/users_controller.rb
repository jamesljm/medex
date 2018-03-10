class UsersController < Clearance::UsersController
  # before_action :find_user_with_id, only: [:edit, :update]

  def new
    @user = User.new
    @patient = Patient.new
    @doctor = Doctor.new
  end

  # def index
  #   @user = User.all
  # end

  # def edit
  #   @user = User.find(params[:id])
  # end

  # def show
  #   @user = User.find(params[:id])
  # end

# private
#   def find_user_with_id
#     @user = User.find(params[:id])
#   end
end
