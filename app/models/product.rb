class Product < ActiveRecord::Base
  has_many :inclusions
  has_many :meditations, :through => :inclusions
end
