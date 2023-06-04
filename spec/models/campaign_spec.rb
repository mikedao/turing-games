require 'rails_helper'

RSpec.describe Campaign, type: :model do
  describe 'relationships' do
    it { should have_many :campaign_users }
    it { should have_many(:users).through(:campaign_users)}
    it { should have_many :characters }
  end
end