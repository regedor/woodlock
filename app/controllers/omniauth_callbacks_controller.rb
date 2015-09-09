class OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def facebook
    woodlock_oauth_callback('facebook')
  end

  def google_oauth2
    woodlock_oauth_callback('google')
  end

  private

  def woodlock_oauth_callback(kind)
    user = User.find_or_create_with_oauth(request.env['omniauth.auth'])

    if user.persisted?
      set_photo_url(user, kind)
      set_gender(user, kind)
      sign_in_and_redirect user, event: :authentication
      set_flash_message(:notice, :success, kind: kind.titleize) if is_navigational_format?
    else
      session['devise.#{kind}_data'] = request.env['omniauth.auth']
      redirect_to sign_in_url
    end
  end

  def set_photo_url(user, kind)
    if user.photo_url.nil? || user.photo_url.include?('google') && kind == 'facebook'
      user.photo_url = (request.env["omniauth.auth"]).info.image 
      user.save
    end
  end

  def set_gender(user, kind)
    if user.gender.nil? && kind == 'facebook'
      user.gender = (request.env["omniauth.auth"]).extra.raw_info.gender
    end
  end
end
