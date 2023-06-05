require 'rails_helper'

RSpec.describe 'Admin can edit existing campaigns', type: :feature do
  context 'as an admin user' do
    it 'can edit an existing campaign' do
      admin = create(:user, role: 1)

      campaign = create(:campaign)                                  

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

      visit admin_dashboard_path

      within "##{dom_id(campaign)}" do
        click_on 'Edit'
      end

      expect(current_path).to eq(edit_admin_campaign_path(campaign))

      fill_in 'campaign[title]', with: 'Totally Edited'
      find(:xpath, "//\*[@id='campaign_description_trix_input_campaign_#{campaign.id}']", visible: false).set('Changed field')
      click_on 'Update Campaign'

      expect(current_path).to eq(admin_campaigns_path)

      expect(page).to have_content('Totally Edited')
      expect(page).to have_content('Changed field')

      expect(page).to_not have_content('Campaign 1')
      expect(page).to_not have_content('Campaign 1 Description')
    end
  end
end


