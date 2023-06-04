require 'rails_helper'

RSpec.describe 'Campaign show pages available for users only', type: :feature do
  context 'as a logged in user' do
    it 'can see the campaign show page' do
      user = User.create( username: 'username_test',
                          first_name: 'first_name_test',
                          last_name: 'last_name_test',
                          email: 'email_test',
                          password: 'password_test',
                          role: 0)
      campaign = Campaign.create( title: 'campaign_1',
                                  description: 'campaign_1_description'
                                )

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

      visit root_path

      within("#campaign_1") do
        click_on 'View Campaign'
      end

      expect(current_path).to eq(campaign_path(campaign))
    end
  end

  context 'as a visitor' do
    it 'can not see the campaign show page' do
      campaign = Campaign.create( title: 'campaign_1',
                                  description: 'campaign_1_description'
                                )

      visit root_path

      expect(page).to_not have_link('View Campaign')
    
      visit campaign_path(campaign)
      expect(current_path).to eq(root_path)
    end
  end
end