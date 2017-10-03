class ConfirmationMailer < ApplicationMailer
  default from: "elstenman@gmail.com"

  def new_registration(user)
    @user = user
    mail(to: user.email, subject: "Registration Confirmation")
  end
  
end
