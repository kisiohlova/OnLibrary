class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :rememberable, :validatable
  validates :username, :first_name, :last_name, :email, presence: true
  validates :email, :username, uniqueness: true
  validates :username, length: { minimum: 3, maximum: 20 },
                        format: { with: /\A[a-z0-9_]+\z/,
                        message: "only allows letters in lowercase, numbers, and underscores" }
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }
end
