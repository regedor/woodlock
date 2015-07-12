class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :omniauthable, :confirmable, :recoverable, :rememberable, :trackable, :validatable
  
  validates :first_name, presence: true,
                         length: { maximum: 30 },
                         format: { with: /\A[a-zA-Z]+\z/, message: "only allows letters" }

  validates :last_name, presence: true,
                        length: { maximum: 30 },
                        format: { with: /\A[a-zA-Z]+\z/, message: "only allows letters" }

  validates :email, presence: true,
                    format: { with: /\b[A-Z0-9._%a-z\-]+@(?:[A-Z0-9a-z\-]+\.)+[A-Za-z]{2,4}\z/ }

  def self.find_or_create_with_oauth(auth)
    User.where(provider: auth.provider, uid: auth.uid).first ||
    User.where(email: auth.info.email).first ||
    User.create(first_name: auth.info.first_name ,last_name: auth.info.last_name ,provider: auth.provider, uid: auth.uid, email: auth.info.email, password: Devise.friendly_token[0,20])
  end

  def full_name
    name = first_name + " " + last_name
    name.downcase.titleize
  end
  
end