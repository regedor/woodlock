class User < ActiveRecord::Base
  devise :database_authenticatable,
         :registerable,
         :omniauthable,
         :confirmable,
         :recoverable,
         :rememberable,
         :trackable,
         :validatable

  validates :first_name, presence: true,
                         length: { maximum: 30 }

  validates :last_name, presence: true,
                        length: { maximum: 30 }

  validates :email, presence: true,
                    format: { with: /\b[A-Z0-9._%a-z\-]+@(?:[A-Z0-9a-z\-]+\.)+[A-Za-z]{2,4}\z/ }

  def self.find_or_create_with_oauth(auth)
    stored_user =
      User.find_by(provider: auth.provider, uid: auth.uid) ||
      User.find_by(email: auth.info.email)

    if stored_user
      stored_user
    else
      user = User.new(first_name: auth.info.first_name,
                      last_name: auth.info.last_name,
                      provider: auth.provider,
                      uid: auth.uid,
                      email: auth.info.email,
                      password: Devise.friendly_token[0, 20])
      user.skip_confirmation!
      user.save!
      WoodlockWelcomeMailer.omniauth_welcome(user, auth.provider).deliver
      user
    end
  end

  def full_name
    name = first_name + ' ' + last_name
    name.downcase.titleize
  end
end
