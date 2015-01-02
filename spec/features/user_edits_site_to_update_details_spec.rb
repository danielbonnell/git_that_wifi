require "rails_helper"

feature "User edits site", %{
  As user I want to edit site
  to provide up-to-date details
  } do

    # Acceptance Criteria:
    # - I must be the owner of the site or the user who created the site
    # - I can edit each individual detail of the site
    # - I cannot edit a site I did not create

    let(:site) do
      FactoryGirl.create(:site)
    end


    scenario "user visits their site page" do
      visit site_path(site)

      click_on "Edit"
      fill_in "site[description]", with: "Hey we've changed the site"
      click_on "Submit"
      expect(page).to have_content site.description
    end

    scenario "user visits a site that is not users" do
      visit site_path(site)

      page.should not_have_selector(:link_or_button, "Edit")
    end
  end