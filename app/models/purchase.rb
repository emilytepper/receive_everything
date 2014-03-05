class Purchase < ActiveRecord::Base
  belongs_to :product
  belongs_to :mystic
  belongs_to :price
end
