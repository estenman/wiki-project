class Charge < ActiveRecord::Base
  belongs_to :user
  after_save :update_user_charged

  private

  def update_user_charged
    user.update_role
  end
end
