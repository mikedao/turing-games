require 'rails_helper'

RSpec.describe CampaignUser, type: :model do
  describe 'relationships' do
    it { should belong_to :campaign }
    it { should belong_to :user }
  end
end