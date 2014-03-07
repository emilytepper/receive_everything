class Mystic < ActiveRecord::Base
  has_many :accesses
  has_many :meditations, :through => :accesses
  has_many :purchases

  after_create :gain_access_to_free_meditations

  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :trackable, :validatable, :confirmable
  
  def has_access_to? meditation
    meditations.include? meditation
  end
  
  def has_access_to_product? product
    purchases.map(&:product).include?(product) or product.meditations.all? { |meditation| has_access_to? meditation }
  end
  
  def password_required?
    super unless facebook_id.present?
  end
  
  def gain_access_to_free_meditations
    Meditation.free.each do |meditation|
      accesses.create :meditation => meditation
    end
  end
end
