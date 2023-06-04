require 'rails_helper'

RSpec.describe 'a user can delete a character' do
  context 'as a user' do
    it 'can delete a character' do
      user = create(:user)
      campaign = create(:campaign)
      character = create(:character, {campaign: campaign, user: user})

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

      visit campaign_character_path(campaign, character)

      click_on 'Delete Character'

      expect(current_path).to eq(campaign_path(campaign))
      expect(page).to_not have_content(character.name)
    end

    it 'cannot delete a character that is not theirs' do
      user = create(:user)
      campaign = create(:campaign)
      character = create(:character, {campaign: campaign})

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

      visit campaign_character_path(campaign, character)

      expect(page).to_not have_content('Delete Character')
    end
  end
end