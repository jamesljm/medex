class ExampleMailer < ApplicationMailer
  default from: "medexgroup937@gmail.com"

  def sample_email(user)
    @user = user
    mail(to: @user.email, subject: 'Welcome to Medex')
  end
end

