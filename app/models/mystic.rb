class Mystic < ActiveRecord::Base
  has_many :accesses
  has_many :meditations, :through => :accesses
  has_many :purchases

  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :trackable, :validatable, :confirmable
  
  def has_access_to? meditation
    meditations.include? meditation
  end
  
  def has_access_to_product? product
    purchases.map(&:product).include? product
  end
  
  def password_required?
    super unless facebook_id.present?
  end
end
