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

    first_name = "Ron"
    last_name = "Paul"
    fill_in "user[first_name]", with: first_name
    fill_in "user[last_name]", with: last_name
    fill_in "user[password]", with: "passwerd"
    fill_in "user[password_confirmation]", with: "passwerd"
    fill_in "user[current_password]", with: user.password
    click_on "Update"

    visit user_path(user)
    expect(page).to have_content first_name
    expect(page).to have_content last_name
  end
end
