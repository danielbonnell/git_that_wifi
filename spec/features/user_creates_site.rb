require "rails_helper"

feature "user registers", %{
  As a user
  I want to be able to create a site to work
  So that I can share it with others
  } do
  #
  # Acceptance Criteria:
  # -Must give name location, address, category of place, picture(optional), amenities
  # -should be brought to the ddetails page for the meetup after I create it.
  # -have to be signed in, in order to create it
  # -should be able to create the location from the index page
  # -should see a message that lets me know that I have created a meetup successfully
  # -should see error if not created successfully
  # -I should be redirected to a log in page if i try to go to the new site page while logged out


  # before :each do
  #   # user = FactoryGirl.create(:user)
  #
  #   # visit new_user_registration_path
  #   # fill_in "Email", with: user.email
  #   # fill_in "Password", with: user.password
  #   # fill_in "First", with: user.first_name
  #   # fill_in "Last", with: user.last_name
  #   # fill_in "Password confirmation", with: user.password
  #   #
  #   # click_button "Sign up"
  #
  #   visit new_user_session_path
  #
  #   fill_in "Email", with: user.email
  #   fill_in "Password", with: user.password
  #
  #   click_button "Sign in"
  #
  # end

  scenario "if signed in" do


      site = FactoryGirl.create(:site)
      user = User.find(site.user_id)


      visit new_user_session_path

      fill_in "Email", with: user.email
      fill_in "Password", with: "password"

      click_button "Sign in"

      visit new_site_path


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
