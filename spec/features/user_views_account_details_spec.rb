require 'rails_helper'

feature 'user sees account details', %Q{
  As a user, I want to view my account page,
  So I can see my account & make any changes

  Acceptance Criteria:
  -[ ] I see my first name, last name, email, and avatar
  -[ ] i see a link to edit my information
  } do

    scenario "visit your account detail and edit" do

    visit show_user_path

    expect(page).to have_content "First name"
    expect(page).to have_content "Last name"
    expect(page).to have_content "Email"
    expect(page).to have_content "Avatar"
    expect(page).to have_content "Edit"
    end
end
