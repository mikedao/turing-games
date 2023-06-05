require 'rails_helper'
include ActionView::RecordIdentifier

RSpec.describe 'Campaign show pages available for users only', type: :feature do
  context 'as a logged in user' do
    it 'can see the campaign show page' do
      user = create(:user)
      campaign = create(:campaign)

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

      visit root_path

      within("##{dom_id(campaign)}") do
        click_on 'View Campaign'
      end

      expect(current_path).to eq(campaign_path(campaign))
    end
  end

  context 'as a visitor' do
    it 'can not see the campaign show page' do
      campaign = create(:campaign)
      visit root_path

      expect(page).to_not have_link('View Campaign')
    
      visit campaign_path(campaign)
      expect(current_path).to eq(root_path)
    end
  end
end