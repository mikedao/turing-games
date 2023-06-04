require 'rails_helper'

RSpec.describe 'User can add themselves to a campaign', type: :feature do
  context 'as a logged in user' do
    it 'can add themselves to a campaign' do
      user = create(:user)
      campaign = create(:campaign)

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

      visit campaign_path(campaign)

      within('.campaign-users') do
        expect(page).to_not have_content(user.username)
      end

      click_on 'Join Campaign'

      expect(current_path).to eq(campaign_path(campaign))

      within('.campaign-users') do
        expect(page).to have_content(user.username)
      end
    end

    it 'can not add themselves to a campaign they are already a part of' do
      user = create(:user)
      campaign = create(:campaign)
      campaign_user = CampaignUser.create( campaign_id: campaign.id,
                                           user_id: user.id
                                         )

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

      visit campaign_path(campaign)

      within('.campaign-users') do
        expect(page).to have_content(user.username)
      end

      expect(page).to_not have_link('Join Campaign')
    end
  end
end