class Patient < User
    has_one :health

    # validates :email, uniqueness: true
end
