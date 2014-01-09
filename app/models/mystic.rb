class Mystic < ActiveRecord::Base
  has_many :accesses
  has_many :meditations, :through => :accesses

  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :trackable, :validatable, :confirmable
  
  def has_access_to? meditation
    meditations.include? meditation
  end
  
  def password_required?
    super unless facebook_id.present?
  end
end
