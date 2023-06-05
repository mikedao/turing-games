require 'rails_helper'

RSpec.describe 'an admin can destroy a character' do
  context 'as an admin' do
    it 'can destroy a character' do
      admin = create(:user, role: 1)
      campaign = create(:campaign)
      character = create(:character, campaign: campaign)

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

      visit admin_character_path(character)

      click_on 'Delete Character'

      expect(current_path).to eq(admin_characters_path)
      expect(page).to_not have_content(character.name)
    end
  end
end