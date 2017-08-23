class Woodlock::User < ApplicationRecord
  self.table_name = "woodlock_users"

  devise \
    :database_authenticatable,
    :registerable,
    :recoverable,
    :rememberable,
    :trackable,
    :validatable,
    :omniauthable,
    omniauth_providers: [:google_oauth2, :facebook, :github]

  validates :email, presence: true, uniqueness: true, format: { with: Devise.email_regexp }

  def self.find_or_create_with_oauth(auth)
    auth_parser = Woodlock::OauthParser.new(auth)
    user        = Woodlock::User.find_by(email: auth_parser.email)

    if user
      user.oauth_after_find_or_create_actions(auth_parser)
    else
      user = Woodlock::User.new(email: auth_parser.email, password: Devise.friendly_token[0, 20])
      # user.skip_confirmation!
      user.save ? user.oauth_after_find_or_create_actions(auth_parser) : false
    end
  end

  def full_name
    first_name.blank? || last_name.blank? ? "" : (first_name + " " + last_name).downcase.titleize
  end

  def photo_url
    facebook_photo_url || google_photo_url || github_photo_url
  end

  def oauth_after_find_or_create_actions(auth_parser)
    self.first_name      = auth_parser.first_name
    self.last_name       = auth_parser.last_name
    self.github_username = auth_parser.github_username if auth_parser.provider.eql?("github")
    self.gender          = auth_parser.gender if auth_parser.provider.eql?("facebook")

    assign_provider_photo_url(auth_parser)

    # TODO
    # Woodlock::WelcomeMailer.welcome(user, auth.provider).deliver_now if Woodlock.welcome_email
    save
    self
  end

  private

  def assign_provider_photo_url(auth_parser)
    case auth_parser.provider
    when "facebook"
      self.facebook_photo_url = auth_parser.image
    when "google_oauth2"
      self.google_photo_url = auth_parser.image
    when "github"
      self.github_photo_url = auth_parser.image
    end
  end
end
