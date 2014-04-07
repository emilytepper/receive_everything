module CommentsHelper
  def display_comments_on subject
    div_for subject, 'display_comments_on' do
      Comment.on_subject(subject).active.not_reply.map do |comment|
        display_comment(comment)
      end.join.html_safe
    end
  end
  
  def display_comment comment, class_name = nil
    div_for(comment, :class => class_name) do
      "#{comment.mystic.name}: #{comment.text} #{link_to('Reply', reply_comment_path(comment), :remote => true)}".html_safe
    end + 
    comment.replies.active.map do |reply|
      display_comment reply, "reply#{class_name}"
    end.join.html_safe
  end
  
  def comment_form_for subject, reply_to = nil
    form_for subject.comments.new, :remote => true, :class => 'comment_form' do |f|
      f.text_area(:text) +
      f.submit("Save") +
      f.hidden_field(:subject_type, :value => subject.class.name) +
      f.hidden_field(:subject_id, :value => subject.id) + 
      (reply_to ? f.hidden_field(:is_reply_to, :value => reply_to.id) : '')
    end
  end
end
