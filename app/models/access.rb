class Access < ActiveRecord::Base
  belongs_to :meditation
  belongs_to :mystic
  validates :mystic_id, :presence => true
  validates :meditation_id, :uniqueness => {scope: :mystic_id}, :presence => true
end
