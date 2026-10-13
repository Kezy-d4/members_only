class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :name, :email, presence: true, uniqueness: true
  validates :name, length: { in: 3..20 }
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :encrypted_password, presence: true, length: { minimum: 8 }
  has_many :posts
end
