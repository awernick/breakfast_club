class User < ActiveRecord::Base
  # Callbacks
  before_save { self.email = email.downcase }
  before_create :generate_authentication_token!

  # Associations
  belongs_to :university
  has_many :attendances
  has_many :study_groups, through: :attendances

  # Validations
  validates :first_name, presence: true, length: { maximum: 25 }
  validates :last_name, presence: true, length: { maximum: 25 }
  validates :auth_token, uniqueness: true

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/
  validates :email, presence: true, length: { maximum: 255 },
                    format: { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }
  
  # Secure Password
  has_secure_password
  validates :password, presence: true, length: { minimum: 6 } 
  
  def generate_authentication_token!
    begin
      self.auth_token = (0...20).map { (65 + rand(26)).chr }.join 
    end while self.class.exists?(auth_token: auth_token)
  end
end 
