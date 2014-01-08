class FacebookController < ApplicationController
  def new_session
    if current_facebook_user
      current_facebook_user.fetch
      if @mystic = Mystic.find_by_facebook_id(current_facebook_user.id)
        sign_in @mystic
      elsif @mystic = Mystic.find_by_email(current_facebook_user.email)
        @mystic.update_attribute(:facebook_id, current_facebook_user.id)
        @mystic.confirm!
        sign_in @mystic
      else
        @mystic = Mystic.create :email => current_facebook_user.email, :facebook_id => current_facebook_user.id
        @mystic.confirm!
        sign_in @mystic
      end
    end
    redirect_to root_url
  end
end
