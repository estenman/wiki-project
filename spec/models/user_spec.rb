require 'rails_helper'

RSpec.describe User, type: :model do
  describe "after_create" do

    it "sends an email to users who have registered" do
      register = user.create(username: username, email: email, password: password)
      expect(ConfirmationMailer).to receive(:new_registration).with(user).and_return(double(deliver_now: true))

      @user.save!
    end

  end
end
