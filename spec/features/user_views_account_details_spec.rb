require "rails_helper"

feature "user sees account details", %Q{
  As a user, I want to view my account page,
  So I can see my account & make any changes

  Acceptance Criteria:
  -[ ] I see my first name, last name, email, and avatar
  -[ ] i see a link to edit my information
  } do

  scenario "visit your account detail and edit" do
    user = FactoryGirl.create(:user)
    visit new_user_session_path
    fill_in "Email", with: user.email
    fill_in "Password", with: user.password

    visit user_path(user)

    expect(page).to have_content user.first_name
    expect(page).to have_content user.last_name
    expect(page).to have_content user.email
    expect(page).to have_content "Edit"
  end

  scenario "user tries to edit account user is signed out" do
    visit edit_user_registration_path
    expect(page).to have_content
    "You need to sign in or sign up before continuing."
  end

end
