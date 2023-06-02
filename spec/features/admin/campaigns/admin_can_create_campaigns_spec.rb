require 'rails_helper'

RSpec.describe 'Admin can create campaigns', type: :feature do
  context 'as an admin user' do
    it 'can create a campaign' do
    admin = User.create(username: 'admin_test',
                        password: 'password_test',
                        first_name: 'first_name_test',
                        last_name: 'last_name_test',
                        email: 'email_test',
                        role: 1
                      )
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

    visit admin_dashboard_path
    click_on "Create Campaign"

    expect(current_path).to eq(new_admin_campaign_path)
    
    fill_in :campaign_title, with: "Campaign Title"
    
    # * This is the code that allows us to fill in the Trix editor
    # * I had to commit a sin to get this to work, used this blog post: https://tosbourn.com/testing-actiontext-without-javascript/

    find(:xpath, "//\*[@id='campaign_description_trix_input_campaign']", visible: false).set('Campaign Description')
    click_on "Create Campaign"
    expect(current_path).to eq(admin_campaigns_path)
    expect(page).to have_content("Campaign Title")
    expect(page).to have_content("Campaign Description")
    end
  end
end