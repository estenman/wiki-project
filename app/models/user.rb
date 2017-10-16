class User < ActiveRecord::Base

  devise :database_authenticatable, :registerable,
       :recoverable, :rememberable, :trackable, :validatable, :confirmable

  enum role: [:standard, :premium, :admin]

  after_initialize :set_default

  def set_default
    if self.new_record?
      self.role ||= :standard
    end
  end

end
