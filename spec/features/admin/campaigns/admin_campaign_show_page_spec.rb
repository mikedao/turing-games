require 'rails_helper'

RSpec.describe 'Admin can see a campaign', type: :feature do
  context 'as an admin user' do
    it 'can see a campaign' do
      admin = create(:user, role: 1)

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

      campaigns = create_list(:campaign, 2)

      visit admin_campaigns_path

      within "##{campaigns[0].title.parameterize}" do
        click_on 'Details'
      end

      expect(current_path).to eq(admin_campaign_path(campaigns[0]))
      expect(page).to have_content(campaigns[0].title)
      expect(page).to have_content(campaigns[0].description.to_plain_text)

      expect(page).to_not have_content(campaigns[1].title)
      expect(page).to_not have_content(campaigns[1].description.to_plain_text)
    end
  end
end