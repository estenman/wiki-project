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

  def upgrade_role
    update_attribute(:role, "premium")
  end

  def downgrade_role
    update_attribute(:role, "standard")
  end

end
