require 'rails_helper'

RSpec.describe 'a user can edit a character' do
  context 'as a user' do
    it 'can edit a character' do
      user = create(:user)
      campaign = create(:campaign)
      character = create(:character, {campaign: campaign, user: user})

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

      visit campaign_character_path(campaign, character)

      click_on 'Edit Character'

      expect(current_path).to eq(edit_campaign_character_path(campaign, character))

      fill_in :character_name, with: 'name_test'
      find(:xpath, "//\*[@id='character_background_trix_input_character_#{character.id}']", visible: false).set('Something completely different')

      click_on 'Update Character'

      expect(current_path).to eq(campaign_character_path(campaign, character))
      expect(page).to have_content('name_test')
      expect(page).to have_content('Something completely different')
    end
  end 
end