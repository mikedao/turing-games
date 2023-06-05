require 'rails_helper'

RSpec.describe 'an admin can see all characters from a link on the dashboard' do
  context 'as an admin user' do
    it 'can get to the characters index page from the dashboard' do
      admin = create(:user, role: 1)
      campaign = create(:campaign)
      user = create(:user)
      campaign.users << user
      characters = create_list(:character, 3, {campaign: campaign, user: user})

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

      visit admin_dashboard_path

      click_on 'Characters'

      expect(current_path).to eq(admin_characters_path)

      characters.each do |character|
        expect(page).to have_content(character.name)
      end

    end
  end
end
