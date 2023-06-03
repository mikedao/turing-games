require 'rails_helper'

RSpec.describe 'Admin dashboard displays all campaigns', type: :feature do
  context 'as an admin' do
    it 'can see all campaigns on admin dashboard' do
      admin = User.create(username: 'admin_test',
                          password: 'password_test',
                          first_name: 'first_name_test',
                          last_name: 'last_name_test',
                          email: 'email_test',
                          role: 1
                        )

      campaign_1 = Campaign.create( title: 'Campaign 1', 
                                    description: 'Campaign 1 Description'
                                  )
      campaign_2 = Campaign.create( title: 'Campaign 2',
                                    description: 'Campaign 2 Description'
                                  )
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

      visit admin_dashboard_path

      expect(page).to have_content('Campaign 1')
      expect(page).to have_content('Campaign 1 Description')

      expect(page).to have_content('Campaign 2')
      expect(page).to have_content('Campaign 2 Description')
    end
  end
end