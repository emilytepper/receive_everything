class Inclusion < ActiveRecord::Base
  belongs_to :product
  belongs_to :meditation
  validates :product_id, :presence => true
  validates :meditation_id, :uniqueness => {scope: :product_id}, :presence => true
  acts_as_list :scope => :product_id
end
