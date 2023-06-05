class Campaign < ApplicationRecord
  has_rich_text :description
  has_one_attached :image

  has_many :campaign_users
  has_many :users, through: :campaign_users
  has_many :characters
end
