class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :photos, dependent: :destroy
  has_many :albums, dependent: :destroy
  scope :all_except, ->(user) { where.not(id: user)}

  def active_for_authentication?    # override this method to check if user is deactivated
    super && is_active?
  end
  
  def is_active?
    self.active
  end
  
  def inactive_message              #deactivation message
    "Sorry, this account has been deactivated."
  end
end
