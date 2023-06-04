require 'rails_helper'

RSpec.describe 'a user can create a character in a campaign' do
  context 'as a user' do
    it 'can create a character in a campaign' do
      user = create(:user)
      campaign = create(:campaign)
      campaign.users << user

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

      visit campaign_path(campaign)

      click_on 'Create Character'

      expect(current_path).to eq(new_campaign_character_path(campaign))

      fill_in :character_name, with: 'name_test'
      find(:xpath, "//\*[@id='character_background_trix_input_character']", visible: false).set('Character background')
      
      click_on 'Create Character'

      expect(current_path).to eq(campaign_character_path(campaign.id, Character.last.id))
      expect(page).to have_content('name_test')
      expect(page).to have_content('Character background')
    end

    it 'cannot create a character without a name' do
      user = create(:user)
      campaign = create(:campaign)
      campaign.users << user

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

      visit campaign_path(campaign)

      click_on 'Create Character'

      expect(current_path).to eq(new_campaign_character_path(campaign))

      find(:xpath, "//\*[@id='character_background_trix_input_character']", visible: false).set('Character background')
      
      click_on 'Create Character'

      expect(page).to have_content("Name can't be blank")
    end

    it 'cannot create a character unless it has joined the campaign' do
      user = create(:user)
      campaign = create(:campaign)

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

      visit campaign_path(campaign)

      expect(page).to_not have_content('Create Character')

      click_on 'Join Campaign'

      expect(current_path).to eq(campaign_path(campaign))

      expect(page).to have_content('Create Character')
    end
  end
end