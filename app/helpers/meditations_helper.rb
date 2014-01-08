module MeditationsHelper
  def soundcloud_embed_for_meditation meditation
    %Q!<iframe width="100%" height="166" scrolling="no" frameborder="no" src="https://w.soundcloud.com/player/?url=#{meditation.soundcloud_url}&amp;color=ff6600&amp;auto_play=false&amp;show_artwork=true"></iframe>!.html_safe
  end
end
