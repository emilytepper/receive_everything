class Product < ActiveRecord::Base
  has_many :inclusions
  has_many :meditations, :through => :inclusions
  has_many :prices
  
  def current_price
    prices.current.active.lowest.first
  end
  
  def current_price_in_cents
    current_price.andand.cents.to_i
  end
end
