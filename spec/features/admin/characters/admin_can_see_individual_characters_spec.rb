require 'rails_helper'

RSpec.describe 'an admin can see individual characters' do
  context 'as an admin' do
    it 'can see individual characters' do
      admin = create(:user, role: 1)
      campaign = create(:campaign)
      characters = create_list(:character, 3, campaign: campaign)

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

      visit admin_characters_path
      within ".characters" do
        characters.each do |character|
          expect(page).to have_link(character.name)
        end
      end

      within "#character-#{characters.first.id}" do
        click_on characters.first.name
      end

      expect(current_path).to eq(admin_character_path(characters.first))
      expect(page).to have_content(characters.first.name)
      expect(page).to have_content(characters.first.background.to_plain_text)
    end
  end
end