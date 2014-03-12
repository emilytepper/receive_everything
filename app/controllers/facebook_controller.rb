class FacebookController < ApplicationController
  def new_session
    if current_facebook_user
      current_facebook_user.fetch
      if @mystic = Mystic.find_by_facebook_id(current_facebook_user.id)
        sign_in @mystic
      elsif @mystic = Mystic.find_by_email(current_facebook_user.email)
        @mystic.update_attribute(:facebook_id, current_facebook_user.id)
        if @mystic.first_name.blank?
          @mystic.update_attribute :first_name, current_facebook_user.first_name
        end
        if @mystic.last_name.blank?
          @mystic.update_attribute :last_name, current_facebook_user.last_name
        end
        @mystic.confirm!
        sign_in @mystic
      else
        @mystic = Mystic.new :email => current_facebook_user.email, :facebook_id => current_facebook_user.id, :first_name => current_facebook_user.first_name, :last_name => current_facebook_user.last_name
        @mystic.skip_confirmation!
        @mystic.save
        sign_in @mystic
      end
    end
    if URI(request.referrer).path == 'goddesses/new'
      redirect_to new_goddess_path
    else
      Rails.logger.info "request.referrer = #{URI(request.referrer)}"
      redirect_to root_url
    end
  end
end
