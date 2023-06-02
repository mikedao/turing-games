require 'rails_helper'

RSpec.describe 'User can be created', type: :feature do
  context 'as a visitor' do
    it 'creates new user' do
      visit root_path

      click_on 'Sign Up'

      expect(current_path).to eq(new_user_path)

      username    = 'username_test'
      password    = 'password_test'
      first_name  = 'first_name_test'
      last_name   = 'last_name_test'
      email       = 'email@test.com'
      
      fill_in :user_username, with: username
      fill_in :user_password, with: password
      fill_in :user_first_name, with: first_name
      fill_in :user_last_name, with: last_name
      fill_in :user_email, with: email

      click_on 'Create User'

      expect(page).to have_content("Welcome, #{username}!")
    end

    it 'cannot create new user with missing information' do
      username    = 'username_test'
      password    = 'password_test'
      first_name  = 'first_name_test'
      last_name   = 'last_name_test'
      email       = 'email@test.com'

      visit new_user_path

      # fill_in :user_username, with: username
      fill_in :user_password, with: password
      fill_in :user_first_name, with: first_name
      fill_in :user_last_name, with: last_name
      fill_in :user_email, with: email

      click_on 'Create User'

      expect(page).to have_content("Username can't be blank")

      visit new_user_path

      fill_in :user_username, with: username
      # fill_in :user_password, with: password
      fill_in :user_first_name, with: first_name
      fill_in :user_last_name, with: last_name
      fill_in :user_email, with: email
      
      click_on 'Create User'

      expect(page).to have_content("Password can't be blank")

      visit new_user_path

      fill_in :user_username, with: username
      fill_in :user_password, with: password
      # fill_in :user_first_name, with: first_name
      fill_in :user_last_name, with: last_name
      fill_in :user_email, with: email
      
      click_on 'Create User'

      expect(page).to have_content("First name can't be blank")

      visit new_user_path

      fill_in :user_username, with: username
      fill_in :user_password, with: password
      fill_in :user_first_name, with: first_name
      # fill_in :user_last_name, with: last_name
      fill_in :user_email, with: email
      
      click_on 'Create User'

      expect(page).to have_content("Last name can't be blank")

      visit new_user_path

      fill_in :user_username, with: username
      fill_in :user_password, with: password
      fill_in :user_first_name, with: first_name
      fill_in :user_last_name, with: last_name
      # fill_in :user_email, with: email
      
      click_on 'Create User'

      expect(page).to have_content("Email can't be blank")
    end
  end 
end