class Campaign < ApplicationRecord
  has_rich_text :description

  has_many :campaign_users
  has_many :users, through: :campaign_users
end
