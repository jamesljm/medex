class Doctor < User
    has_many :bookings
    has_many :likes
    has_many :authorizations
    has_many :clinics

  # validates :email, uniqueness: true
  if @current_user != nil
    validates :license, presence: true
  end 

  def self.search(params)
    doctors = Doctor.where("first_name LIKE ? or last_name LIKE ?", "%#{params[:search]}%", "%#{params[:search]}%") if params[:search].present?
    doctors
  end
end
