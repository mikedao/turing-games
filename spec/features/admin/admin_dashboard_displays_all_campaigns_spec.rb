require 'rails_helper'

RSpec.describe 'Admin dashboard displays all campaigns', type: :feature do
  context 'as an admin' do
    it 'can see all campaigns on admin dashboard' do
      admin = create(:user, role: 1)

      campaigns = create_list(:campaign, 2)

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

      visit admin_dashboard_path

      expect(page).to have_content(campaigns[0].title)
      expect(page).to have_content(campaigns[0].description.to_plain_text)

      expect(page).to have_content(campaigns[1].title)
      expect(page).to have_content(campaigns[1].description.to_plain_text )
    end
  end
end