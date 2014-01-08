class Meditation < ActiveRecord::Base
  has_many :inclusions
  has_many :products, :through => :inclusions
  
  scope :not_in_product, lambda { |product| product.inclusions.any? ? where('id not in (?)', product.inclusions.map(&:meditation_id)) : nil }
end
