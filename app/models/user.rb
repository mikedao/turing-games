class User < ApplicationRecord
  validates :username, uniqueness: true, presence: true
  validates_presence_of :password, :first_name, :last_name, :email

  has_secure_password

  enum role: [:default, :admin]

  has_many :campaign_users
  has_many :campaigns, through: :campaign_users
  has_many :characters
end