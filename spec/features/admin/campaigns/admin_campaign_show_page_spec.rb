require 'rails_helper'

RSpec.describe 'Admin can see a campaign', type: :feature do
  context 'as an admin user' do
    it 'can see a campaign' do
      admin = User.create(username: 'admin_test',
                          password: 'password_test',
                          first_name: 'first_name_test',
                          last_name: 'last_name_test',
                          email: 'email_test',
                          role: 1
                        ) 

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

      campaign_1 = Campaign.create( title: 'Campaign 1', 
                                    description: 'Campaign 1 Description'
                                  )
      campaign_2 = Campaign.create( title: 'Campaign 2',
                                    description: 'Campaign 2 Description'
                                  )

      visit admin_campaigns_path

      within '#campaign-1' do
        click_on 'Details'
      end

      expect(current_path).to eq(admin_campaign_path(campaign_1))
      expect(page).to have_content('Campaign 1')
      expect(page).to have_content('Campaign 1 Description')

      expect(page).to_not have_content('Campaign 2')
      expect(page).to_not have_content('Campaign 2 Description') 
    end
  end
end