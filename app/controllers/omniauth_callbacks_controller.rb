class OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def facebook
    woodlock_oauth_callback('facebook')
  end

  def google_oauth2
    woodlock_oauth_callback('google')
  end

  def github
    woodlock_oauth_callback('github')
  end

  private

  def woodlock_oauth_callback(kind)
    auth = request.env['omniauth.auth']
    user = User.find_or_create_with_oauth(auth)

    if user.persisted?
      set_name(user, auth)
      set_photo_url(user, auth)
      set_gender(user, auth)
      sign_in_and_redirect user, event: :authentication
      set_flash_message(:notice, :success, kind: kind.titleize) if is_navigational_format?
    else
      session['devise.#{kind}_data'] = request.env['omniauth.auth']
      redirect_to sign_in_url
    end
  end

  def set_name(user, auth)
    unless user.first_name && user.last_name
      if auth.info.first_name && auth.info.last_name
        user.first_name = auth.info.first_name
        user.last_name = auth.info.last_name
      elsif auth.info.name
        user.first_name = auth.info.name.gsub(/\s+/m, ' ').strip.split(" ")[0]
        user.last_name = auth.info.name.gsub(/\s+/m, ' ').strip.split(" ")[-1]
      end
      user.save
    end
  end

  def set_photo_url(user, auth)
    if auth.provider == 'facebook' && user.facebook_photo_url != auth.info.image
      user.facebook_photo_url = auth.info.image
      user.save
    elsif auth.provider == 'google_oauth2' && user.google_photo_url != auth.info.image
      user.google_photo_url = auth.info.image
      user.save
    elsif auth.provider == 'github' && user.github_photo_url != auth.info.image
      user.github_photo_url = auth.info.image
      user.save
    end
  end

  def set_gender(user, auth)
    user.gender = auth.extra.raw_info.gender if auth.provider == 'facebook' && user.gender.nil?
    user.save
  end
end
