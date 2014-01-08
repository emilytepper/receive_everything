class Price < ActiveRecord::Base
  belongs_to :product
  
  scope :current, lambda { where('(start_time < ? or start_time is null) and (end_time > ? or end_time is null)', Time.now, Time.now) }
  scope :active, lambda { where :active => true }
  scope :lowest, lambda { order :cents }
end
