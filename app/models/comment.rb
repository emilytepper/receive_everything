class Comment < ActiveRecord::Base
  belongs_to :mystic
  belongs_to :subject, :polymorphic => true
  has_many :replies, :foreign_key => :is_reply_to, :class_name => 'Comment'
  
  scope :active, where('hidden is null or hidden = ?', false)
end
