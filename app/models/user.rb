class User < ApplicationRecord
  validates :name,  presence: true, length:{maximum: 50 }
    VALID_EMAIL_REGEX =/\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
    validates :email, presence: true, length: {maximum: 75 },
                     format: { with: URI::MailTo::EMAIL_REGEXP },
                     uniqueness: { case_sensitive: false }
  has_secure_password
  validates :password, presence: true, length: { minimum: 6}
  validates :address,  presence: true
  validates :postcode, presence: true
  
  has_one :cart, dependent: :destroy
  has_many :reservations, dependent: :destroy

end