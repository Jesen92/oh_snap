class User < ApplicationRecord
  has_many :user_events
  has_many :events, :through => :user_events

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :authentication_keys => [:username]
          #, :confirmable #korisnik ne može koristiti account bez konfirmacije email-a

  validates :web_auth_token, presence: true, uniqueness: true
  validates :android_auth_token, presence: true, uniqueness: true
  validates :email, presence: true, uniqueness: true, allow_nil: true
  validates :username, presence: true, uniqueness: true

  before_validation :generate_web_auth_token, if: 'web_auth_token.blank?'
  before_validation :generate_android_auth_token, if: 'android_auth_token.blank?'

  def regenerate_web_auth_token!
    generate_web_auth_token
    save
  end

  def regenerate_android_auth_token!
    generate_android_auth_token
    save
  end

  def email_required?
    false
  end

  private

  def generate_web_auth_token
    loop do
      self.web_auth_token = Devise.friendly_token
      break unless User.exists?(web_auth_token: web_auth_token)
    end
  end

  def generate_android_auth_token
    loop do
      self.android_auth_token = Devise.friendly_token
      break unless User.exists?(android_auth_token: android_auth_token)
    end
  end

end
