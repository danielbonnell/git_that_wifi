require "rails_helper"

feature "user creates", %{
  As a user
  I want to be able to create a site to work
  So that I can share it with others
  } do

  scenario "if signed in" do

      site = FactoryGirl.create(:site)
      user = User.find(site.user_id)

      visit new_user_session_path

      fill_in "Email", with: user.email
      fill_in "Password", with: "password"

      click_button "Sign in"

      visit new_site_path
      expect(page).to have_content "Create a new site"

      fill_in "Name", with: site.name
      fill_in "Address", with: site.address
      fill_in "City", with: site.city
      fill_in "State", with: site.state
      fill_in "Zip", with: site.zip
      fill_in "Description", with: site.description
      fill_in "Phone Number", with: site.phone
      fill_in "URL", with: site.url
      fill_in "Cost Rating", with: site.cost_rating
      click_on "Create Site"

      expect(page).to have_content site.name
      expect(page).to have_content site.address
      expect(page).to have_content site.city
      expect(page).to have_content site.state
      expect(page).to have_content site.zip
      expect(page).to have_content site.description
      expect(page).to have_content site.phone
      expect(page).to have_content site.url
      expect(page).to have_content site.cost_rating
      expect(page).to have_content "Edit"
      expect(page).to have_content "Site created successfully"

  end
  scenario "site is not created successfully" do
    site = FactoryGirl.create(:site)
    user = User.find(site.user_id)

    visit new_user_session_path

    fill_in "Email", with: user.email
    fill_in "Password", with: "password"

    click_button "Sign in"

    visit new_site_path

    click_button "Create Site"
    expect(page).to have_content "error"

  end

  scenario "user sees create site" do

    user = FactoryGirl.create(:user)
    visit new_user_session_path

    fill_in "Email", with: user.email
    fill_in "Password", with: "password"

    click_button "Sign in"

    visit sites_path

    expect(page).to have_content "Create new site"
  end
end
