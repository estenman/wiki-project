class ConfirmationMailer < ApplicationMailer
  default from: "elstenman@gmail.com"
  include Devise::Controllers::UrlHelpers # Optional. eg. `confirmation_url`
  default template_path: 'devise/mailer' # to make sure that your mailer uses the devise views

  #def new_registration(user)
  #  @user = user
  #  mail(to: user.email, subject: "Registration Confirmation")
  #end

end
