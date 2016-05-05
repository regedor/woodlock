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
    if auth
      user = User.find_or_create_with_oauth(auth)
      if user.persisted?
        update_user_info_from_auth(user, auth)
        sign_in_and_redirect(user, event: :authentication)
        set_flash_message(:notice, :success, kind: kind.titleize) if is_navigational_format?
      else
        redirect_to new_user_session_url, alert: "User was not persisted. Check #{auth.provider.titleize} credentials."
      end
    else
      redirect_to new_user_session_url, alert: 'There was a problem making the omniauth request.'
    end
  end

  def update_user_info_from_auth(user, auth)
    user.update_name_from_auth(auth)
    user.update_photo_url_from_auth(auth)
    user.update_gender_from_auth(auth)
    user.update_github_nickname_from_auth(auth)
  end
end
