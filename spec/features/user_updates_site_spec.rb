require "rails_helper"

feature "user updates site", %{
  As an authenticated user
  I want to update an item's information
  So that I can correct errors or provide new information
  } do

  scenario 'authenticated user sees edit button on show page' do
    edit_site = FactoryGirl.create(:site)
    visit new_user_session_path

    fill_in "Email", with: edit_site.user.email
    fill_in "Password", with: "password"

    click_button "Sign in"

    visit site_path(edit_site)

    expect(page).to have_content "Edit"

  end
  scenario 'unauthenticated user sees edit button on show page' do
    edit_site = FactoryGirl.create(:site)

    visit site_path(edit_site)

    expect(page).to have_no_content "Edit"

  end
  scenario 'authenticated user edits site' do
    edit_site = FactoryGirl.create(:site)
    visit new_user_session_path

    fill_in "Email", with: edit_site.user.email
    fill_in "Password", with: "password"

    click_button "Sign in"


    visit edit_site_path(edit_site)
    fill_in "Name", with: "coffee"


    click_button "Update Site"
    expect(page).to have_content "Site updated successfully"
    expect(page).to have_content "coffee"

  end
  scenario 'authenticated user unsuccessfully edits site' do
      edit_site = FactoryGirl.create(:site)
      visit new_user_session_path

      fill_in "Email", with: edit_site.user.email
      fill_in "Password", with: "password"

      click_button "Sign in"

      visit edit_site_path(edit_site)
      fill_in "Name", with: ""

      click_button "Update Site"
      expect(page).to have_content "error"
  end
end
