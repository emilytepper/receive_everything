class Product < ActiveRecord::Base
  has_many :inclusions
  has_many :meditations, :through => :inclusions
  has_many :prices
  
  scope :ordered, lambda { order(:position) }
  scope :active, lambda { where(:active => true) }
  acts_as_list
  
  def current_price
    prices.current.active.lowest.first
  end
  
  def current_price_in_cents
    current_price.andand.cents.to_i
  end
  
  def current_price_in_dollars
    current_price_in_cents / 100.0
  end
end
