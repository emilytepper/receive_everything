class Goddess < ActiveRecord::Base
  belongs_to :mystic
  attr_accessor :group_choice
end
