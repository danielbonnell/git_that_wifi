require "rails_helper"

feature "user edits profile information", %Q{
  As a user, I want to edit my account page
  So I can update my information

  Acceptance Criteria:
  -[ ] I can update my first name, last name, and email
  -[ ] When I update my page I see my updated information
  } do

    scenario "visit your account detail and edit" do
      user = FactoryGirl.create(:user)
      sign_in_as(user)
      visit edit_user_registration_path(user)


      fill_in "user[first_name]", with: "Ron"
      fill_in "user[last_name]", with: "Paul"
      fill_in "user[password]", with: "passwerd"
      fill_in "user[password_confirmation]", with: "passwerd"
      fill_in "user[current_password]", with: user.password


      click_on "Update"
      expect(page).to have_content user.first_name
      expect(page).to have_content user.last_name
    end
    



end
