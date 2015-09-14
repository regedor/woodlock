class User < ActiveRecord::Base
  include Gravtastic
  gravtastic size: 40, default: 'http://www.apiflat.com/no_user.png'

  devise :database_authenticatable,
    :registerable,
    :omniauthable,
    :confirmable,
    :recoverable,
    :rememberable,
    :trackable,
    :validatable

  validates :first_name,
    presence: true,
    length: { maximum: 30 }

  validates :last_name, presence: true,
                        length: { maximum: 30 }

  validates :email,
    presence: true,
    format: { with: /\b[A-Z0-9._%a-z\-]+@(?:[A-Z0-9a-z\-]+\.)+[A-Za-z]{2,4}\z/ }

  def self.find_or_create_with_oauth(auth)
    stored_user =
      User.find_by(provider: auth.provider, uid: auth.uid) ||
      User.find_by(email: auth.info.email)

    if stored_user
      stored_user
    else

      user = User.new(
        first_name: auth.info.first_name,
        last_name: auth.info.last_name,
        provider: auth.provider,
        uid: auth.uid,
        email: auth.info.email,
        gender: auth.extra.raw_info.gender || 'undefined',
        password: Devise.friendly_token[0, 20])
      user.skip_confirmation!
      user.save
      WoodlockWelcomeMailer.omniauth_welcome(user, auth.provider).deliver_now
      user
    end
  end

  def full_name
    name = first_name + ' ' + last_name
    name.downcase.titleize
  end

  def gravatar?
    gravatar_url.include?('http://files.softicons.com/download/toolbar-icons/free-tabs-color-icons-by-kevin-andersson/png/40/User.png') ? false : true
  end

  private
  def password_required?
    new_record? ? super : false
  end
end
