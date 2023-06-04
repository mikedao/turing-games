class Character < ApplicationRecord
  validates_presence_of :name

  has_rich_text :background

  belongs_to :user
  belongs_to :campaign
end
