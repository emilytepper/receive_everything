class Comment < ActiveRecord::Base
  belongs_to :mystic
  belongs_to :subject, :polymorphic => true
  has_many :replies, :foreign_key => :is_reply_to, :class_name => 'Comment'
  
  validate :text, :presence => true
  
  scope :on_subject, lambda { |subject| where(:subject_id => subject.id, :subject_type => subject.class.name)}
  scope :active, lambda { where('hidden is null or hidden = ?', false) }
end
