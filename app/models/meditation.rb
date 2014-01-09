class Meditation < ActiveRecord::Base
  has_many :inclusions
  has_many :products, :through => :inclusions
  
  scope :not_in_product, lambda { |product| product.inclusions.any? ? where('id not in (?)', product.inclusions.map(&:meditation_id)) : nil }
  scope :free, lambda { where :free => true }
  scope :active, lambda { where :active => true }
  
  def current_price_in_cents
    products.first.andand.current_price_in_cents
  end
  
  def current_price_in_dollars
    current_price_in_cents.andand./ 100.0
  end
end
