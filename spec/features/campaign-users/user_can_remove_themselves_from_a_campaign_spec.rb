require 'rails_helper'

RSpec.describe 'User can remove themselves from a campaign', type: :feature do
  context 'as a logged in user' do
    it 'can remove themselves from a campaign' do
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

      click_on 'Leave Campaign'

      expect(current_path).to eq(campaign_path(campaign))

      within('.campaign-users') do
        expect(page).to_not have_content(user.username)
      end
    end

    it 'can not remove themselves from a campaign they are not a part of' do
      user = create(:user)
      campaign = create(:campaign)
      
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

      visit campaign_path(campaign)

      within('.campaign-users') do
        expect(page).to_not have_content(user.username)
      end

      expect(page).to_not have_link('Leave Campaign')
    end
  end
end