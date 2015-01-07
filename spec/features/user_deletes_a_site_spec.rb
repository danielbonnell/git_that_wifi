require "rails_helper"

feature "User Deletes A Site", %{
  As a user,
  I want to delete a site that I created,
  So that I can remove old sites.

  Acceptance Criteria:

  [ ] If i don"t own the site, I should not see a delete button on the site page
  [ ] If I own the site, i should see a delete button on the site page
  [ ] I should not see the site"s information on the index page anymore
} do

  let(:site) do
    FactoryGirl.create(:site)
  end

  scenario "logged in user deletes a site they created" do
    sign_in_as(site.user)

    visit site_path(site)

    click_on "Delete Site"

    expect(current_path) == sites_path

    expect(page).to_not have_content site.name
  end

  scenario "non logged in user should not see delete button" do
    visit site_path(site)

    expect(page).to_not have_content(:link_or_button, "Delete Site")
  end

end
