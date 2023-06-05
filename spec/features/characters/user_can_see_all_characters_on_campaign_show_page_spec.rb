require 'rails_helper'

RSpec.describe 'a user can see all characters on a campaign show page' do
  context 'as a user' do
    it 'can see all characters on a campaign show page' do
      user = create(:user)
      campaign = create(:campaign)
      characters = create_list(:character, 3, {campaign: campaign, user: user})

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

      visit campaign_path(campaign)

      within ".characters" do
        characters.each do |character|
          expect(page).to have_content(character.name)
        end
      end
    end
  end
end