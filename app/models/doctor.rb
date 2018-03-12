class Doctor < User
    has_many :bookings
    has_many :likes
    has_many :authorizations

    # validates :email, uniqueness: true
end
