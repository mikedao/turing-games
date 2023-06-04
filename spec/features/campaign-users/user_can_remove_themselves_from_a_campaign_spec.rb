require 'rails_helper'

RSpec.describe 'User can remove themselves from a campaign', type: :feature do
  context 'as a logged in user' do
    it 'can remove themselves from a campaign' do
      user = User.create( username: 'username_test',
                          first_name: 'first_name_test',
                          last_name: 'last_name_test',
                          email: 'email_test',
                          password: 'password_test',
                          role: 0)
      campaign = Campaign.create( title: 'campaign_1',
                                  description: 'campaign_1_description'
                                )
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
  end
end