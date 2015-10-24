class User < ActiveRecord::Base
  # Callbacks
  before_save { self.email = email.downcase }

  # Associations
  belongs_to :university
  has_many :attendances
  has_many :study_groups, through: :attendances

  # Validations
  validates :first_name, presence: true, length: { maximum: 25 }
  validates :last_name, presence: true, length: { maximum: 25 }

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/
  validates :email, presence: true, length: { maximum: 255 },
                    format: { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }
  
  # Secure Password
  has_secure_password
  validates :password, presence: true, length: { minimum: 6 } 

end
