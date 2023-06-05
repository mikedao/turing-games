require 'rails_helper'

RSpec.describe 'an admin can edit characters' do
  context 'as an admin' do
    it 'can edit a character' do
      admin = create(:user, role: 1)
      campaign = create(:campaign)
      user = create(:user)
      character = create(:character, {campaign: campaign, user: user})

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

      visit admin_character_path(character)

      click_on 'Edit Character'

      expect(current_path).to eq(edit_admin_character_path(character))

      fill_in :character_name, with: 'name_test'
      find(:xpath, "//\*[@id='character_background_trix_input_character_#{character.id}']", visible: false).set('Something completely different')
      click_on 'Update Character'

      expect(current_path).to eq(admin_character_path(character))
      expect(page).to have_content('name_test')
      expect(page).to have_content('Something completely different')
    end

    it 'cannot edit a character without a name' do
      admin = create(:user, role: 1)
      campaign = create(:campaign)
      user = create(:user)
      character = create(:character, {campaign: campaign, user: user})

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

      visit admin_character_path(character)

      click_on 'Edit Character'

      expect(current_path).to eq(edit_admin_character_path(character))

      fill_in :character_name, with: ''
      click_on 'Update Character'

      expect(page).to have_content("Name can't be blank")
    end
  end
end