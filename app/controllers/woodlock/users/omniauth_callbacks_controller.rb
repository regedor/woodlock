class Woodlock::Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def facebook
    woodlock_oauth_callback("facebook")
  end

  def google_oauth2
    woodlock_oauth_callback("google")
  end

  def github
    woodlock_oauth_callback("github")
  end

  private

  def woodlock_oauth_callback(kind)
    auth = request.env["omniauth.auth"]

    unless auth
      redirect_to new_user_session_url, alert: "There was a problem with the omniauth request."
      return
    end

    user = Woodlock::User.find_or_create_with_oauth(auth)

    if user
      sign_in_and_redirect(user, event: :authentication)
      set_flash_message(:notice, :success, kind: kind.titleize) if is_navigational_format?
    else
      redirect_to new_user_session_url, alert: "Couldn't find or create the user."
    end
  end
end
