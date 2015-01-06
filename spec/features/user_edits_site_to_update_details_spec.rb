require "rails_helper"

feature "User edits site", %{
  As user I want to edit site
  to provide up-to-date details
  } do

    # Acceptance Criteria:
    # - I must be the owner of the site or the user who created the site
    # - I can edit each individual detail of the site
    # - I cannot edit a site I did not create

    let(:user) do
      FactoryGirl.create(:user)
    end

    let(:new_site) do
      FactoryGirl.create(:site, name: "Site name", user: user)
    end

    other_user = FactoryGirl.create(:user)

    scenario "user edits their site page" do
      sign_in_as(user)
      visit site_path(new_site)
      click_on "Edit"
      fill_in "site[description]", with: "Hey we've changed the site"
      click_on "Submit"
      expect(page).to have_content "Hey we've changed the site"
    end

    scenario "user tries to edit a site that is not theirs" do
      sign_in_as(other_user)
      visit site_path(new_site)
      expect(page).to_not have_selector(:link_or_button, "Edit")
    end
  end
