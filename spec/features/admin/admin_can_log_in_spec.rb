require 'rails_helper'

RSpec.describe 'Admin can log in', type: :feature do
  context 'as a visitor' do
    it 'can log in as an admin and be taken to the admin dashboard' do
      user = User.create( username: 'admin_username_test',
                          password: 'password_test',
                          first_name: 'first_name_test',
                          last_name: 'last_name_test',
                          email: 'email_test',
                          role: 1
                        )

    visit login_path

    fill_in :username, with: user.username
    fill_in :password, with: user.password

    click_on 'Log In'

    expect(current_path).to eq(admin_dashboard_path)
    expect(page).to have_content("Welcome, #{user.username}!")
    expect(page).to have_content('Admin Dashboard')
    end
  end

  context 'as a registered user' do
    it 'cannot access the admin dashboard' do
      user = User.create( username: 'username_test',
                          password: 'password_test',
                          first_name: 'first_name_test',
                          last_name: 'last_name_test',
                          email: 'email_test'
                        )

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

      visit admin_dashboard_path

      expect(current_path).to eq(root_path)
      expect(page).to_not have_content('Admin Dashboard')
    end
  end
end