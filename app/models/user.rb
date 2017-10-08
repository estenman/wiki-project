class User < ActiveRecord::Base
  belongs_to :charge

  devise :database_authenticatable, :registerable,
       :recoverable, :rememberable, :trackable, :validatable, :confirmable

  enum role: [:standard, :premium, :admin]

  after_initialize :set_default

  def set_default
    if self.new_record?
      self.role ||= :standard
    end
  end

  def update_role
    update_attribute(:role, "premium")
  end

  #after_create :send_confirmation_emails

  #private

  #def send_confirmation_emails
    #ConfirmationMailer.new_registration(self).deliver_now
  #end
end
