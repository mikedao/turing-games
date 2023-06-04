require 'rails_helper'

RSpec.describe 'User can log out', type: :feature do
  context 'as a logged in user' do
    it 'can log out' do
      user = create(:user)
      
      visit login_path
      
      fill_in :username, with: user.username
      fill_in :password, with: user.password

      click_on 

      expect(page).to have_content("Log Out")
      expect(page).to_not have_content("Log In")
      expect(page).to_not have_content("Sign Up")
      click_on "Log Out"

      expect(current_path).to eq(root_path)
      # save_and_open_page
      expect(page).to have_content("Log In")
      expect(page).to have_content("Sign Up")
    end
  end
end