require 'rails_helper'

RSpec.describe 'Visitor can see campaigns on home page', type: :feature do
  context 'as a visitor' do
    it 'can see campaigns on home page' do
      campaign_1 = Campaign.create( title: 'Campaign 1', 
                                    description: 'Campaign 1 Description'
                                  )
      campaign_2 = Campaign.create( title: 'Campaign 2',
                                    description: 'Campaign 2 Description'
                                  )

      visit root_path

      within '.campaigns' do
        expect(page).to have_content('Campaign 1')
        expect(page).to have_content('Campaign 1 Description')
        expect(page).to have_content('Campaign 2')
        expect(page).to have_content('Campaign 2 Description')
      end
    end
  end
end