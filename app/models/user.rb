class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
       :recoverable, :rememberable, :trackable, :validatable, :confirmable
  #end

  #after_create :send_confirmation_emails

  #private

  #def send_confirmation_emails
    #ConfirmationMailer.new_registration(self).deliver_now
  #end
end
