class OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def facebook
    woodlock_oauth_callback('facebook')
  end

  def google_oauth2
    woodlock_oauth_callback('google')
  end

  private

  def woodlock_oauth_callback(kind)
    auth = request.env['omniauth.auth']
    user = User.find_or_create_with_oauth(auth)

    if user.persisted?
      set_photo_url(user, auth)
      set_gender(user, auth)
      sign_in_and_redirect user, event: :authentication
      set_flash_message(:notice, :success, kind: kind.titleize) if is_navigational_format?
    else
      session['devise.#{kind}_data'] = request.env['omniauth.auth']
      redirect_to sign_in_url
    end
  end

  def set_photo_url(user, auth)
    if auth.provider == 'facebook' && user.facebook_photo_url != auth.info.image
      user.facebook_photo_url = auth.info.image
      user.save
    elsif user.google_photo_url != auth.info.image
      user.google_photo_url = auth.info.image
      user.save
    end
  end

  def set_gender(user, auth)
    user.gender = auth.extra.raw_info.gender if auth.provider == 'facebook' && user.gender == 'undefined'
    user.save
  end
end
