class User < ApplicationRecord
  include Clearance::User
  has_many :authentications, dependent: :destroy

  enum gender: { male: 0, female: 1, not_sure: 2, prefer_not_to_disclose: 3 }

  def self.create_with_auth_and_hash(authentication, auth_hash)
    user = self.create!(
    #  name: auth_hash["name"],
      email: auth_hash["extra"]["raw_info"]["email"],
      password: SecureRandom.hex(10)
    )
    user.authentications << authentication
    return user
  end

  # grab fb_token to access Facebook for user data
  def fb_token
    x = self.authentications.find_by(provider: 'facebook')
    return x.token unless x.nil?
  end

  def name
    "#{self.first_name} #{self.last_name}"
  end
end