require 'rails_helper'

RSpec.describe 'Visitor can see campaigns on home page', type: :feature do
  context 'as a visitor' do
    it 'can see campaigns on home page' do
      campaigns = create_list(:campaign, 2)
      visit root_path

      within '.campaigns' do
        expect(page).to have_content(campaigns[0].title)
        expect(page).to have_content(campaigns[0].description.to_plain_text)
        expect(page).to have_content(campaigns[1].title)
        expect(page).to have_content(campaigns[1].description.to_plain_text)
      end
    end
  end
end