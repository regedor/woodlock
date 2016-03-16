class User < ActiveRecord::Base
  include Gravtastic
  gravtastic size: 40, default: Woodlock.gravatar_default_url

  devise :database_authenticatable,
    :registerable,
    :omniauthable,
    :confirmable,
    :recoverable,
    :rememberable,
    :trackable,
    :validatable

  validates :first_name, length: { maximum: 30 }
  validates :last_name, length: { maximum: 30 }

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
        provider: auth.provider,
        uid: auth.uid,
        email: auth.info.email,
        password: Devise.friendly_token[0, 20])
      user.skip_confirmation!
      user.save!
    end
  end

  def update_name_from_auth(auth)
    if auth.info.first_name && auth.info.last_name
      self.first_name = auth.info.first_name
      self.last_name = auth.info.last_name
    elsif auth.info.name
      self.first_name = auth.info.name.gsub(/\s+/m, ' ').strip.split(" ")[0]
      self.last_name = auth.info.name.gsub(/\s+/m, ' ').strip.split(" ")[-1]
    end
  end

  def update_photo_url_from_auth(auth)
    if auth.provider == 'facebook' && facebook_photo_url != auth.info.image
      self.facebook_photo_url = auth.info.image
    elsif auth.provider == 'google_oauth2' && google_photo_url != auth.info.image
      self.google_photo_url = auth.info.image
    elsif auth.provider == 'github' && github_photo_url != auth.info.image
      self.github_photo_url = auth.info.image
    end
  end

  def update_gender_from_auth(auth)
    self.gender = auth.extra.raw_info.gender if gender.nil? && auth.provider == 'facebook'
  end

  def update_github_nickname_from_auth(auth)
    self.github_nickname = auth.info.nickname if auth.provider == 'github'
  end

  def full_name
    if first_name.blank? || last_name.blank?
      ''
    else
      name = first_name + ' ' + last_name
      name.downcase.titleize
    end
  end

  def gravatar?
    gravatar_url.include?(Woodlock.gravatar_default_url) ? false : true
  end

  def photo_url
    facebook_photo_url || google_photo_url || github_photo_url || gravatar_url
  end

  private

  def password_required?
    new_record? ? super : false
  end
end
