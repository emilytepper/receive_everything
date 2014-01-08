class Meditation < ActiveRecord::Base
  has_many :inclusions
  has_many :products, :through => :inclusions
end
