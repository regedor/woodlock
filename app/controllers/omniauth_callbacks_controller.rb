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
      # this will throw if user is not activated
      sign_in_and_redirect user, event: :authentication
      set_flash_message(:notice, :success, kind: kind.titleize) if is_navigational_format?
    else
      session['devise.#{kind}_data'] = request.env['omniauth.auth']
      redirect_to sign_in_url
    end
  end
end
