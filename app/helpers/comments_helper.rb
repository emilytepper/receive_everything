module CommentsHelper
  def display_comments_on subject
    div_for subject, 'display_comments_on' do
      Comment.on_subject(subject).active.map do |comment|
        display_comment comment
      end.join.html_safe
    end
  end
  
  def display_comment comment
    div_for comment do
      "#{comment.mystic.name}: #{comment.text}"
    end
  end
  
  def comment_form_for subject
    form_for subject.comments.new, :remote => true, :class => 'comment_form' do |f|
      f.text_area(:text) +
      f.submit("Save") +
      f.hidden_field(:subject_type, :value => subject.class.name) +
      f.hidden_field(:subject_id, :value => subject.id)
    end
  end
end