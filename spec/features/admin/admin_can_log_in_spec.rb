require 'rails_helper'

RSpec.describe 'Admin can log in', type: :feature do
  context 'as a visitor' do
    it 'can log in as an admin and be taken to the admin dashboard' do
      admin = create(:user, role: 1)

      visit login_path

      fill_in :username, with: admin.username
      fill_in :password, with: admin.password

      click_on 'Log In'

      expect(current_path).to eq(admin_dashboard_path)
      expect(page).to have_content("Welcome, #{admin.username}!")
      expect(page).to have_content('Admin Dashboard')
    end
  end

  context 'as a registered user' do
    it 'cannot access the admin dashboard' do
      user = create(:user)

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

      visit admin_dashboard_path

      expect(current_path).to eq(root_path)
      expect(page).to_not have_content('Admin Dashboard')
    end
  end
end