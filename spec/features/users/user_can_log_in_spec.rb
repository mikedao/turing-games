require 'rails_helper'

RSpec.describe "Logging In" do
  context "as a visitor" do
    it "can log in with valid credentials" do
      user = create(:user)

      visit root_path

      click_on "Log In"

      expect(current_path).to eq(login_path)

      fill_in :username, with: user.username
      fill_in :password, with: user.password

      click_on "Log In"

      expect(current_path).to eq(root_path)

      expect(page).to have_content("Welcome, #{user.username}")
    end

    it "cannot log in with invalid credentials" do
      user = create(:user)
      
      visit root_path

      click_on "Log In"
    
      fill_in :username, with: user.username
      fill_in :password, with: "wrong_password"

      click_on "Log In"

      expect(current_path).to eq(login_path)
      expect(page).to have_content("Invalid credentials")
    end
  end
end