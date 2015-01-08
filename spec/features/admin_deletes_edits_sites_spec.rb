require "rails_helper"

feature "Admin deletes and edits sites", %{
  As admin I want to edit or delete a site

  Acceptance Criteria:
  When I delete the site, it no longer appears in the site's view
  an error message
  When I edit the site's details, the updated details
  are shown on the site's page
  } do

  let(:user) do
    FactoryGirl.create(:user, role: 2)
  end

  let(:new_site) do
    FactoryGirl.create(:site)
  end

  scenario "admin visits site's details" do
    sign_in_as(user)
    visit site_path(new_site)
    click_on "Edit"
    fill_in "site[description]", with: "This is a description"
    click_on "Update Site"
    expect(page).to have_content "This is a description"
  end

  scenario "admin deletes site" do
    sign_in_as(user)
    visit site_path(new_site)

    click_on "Delete Site"
    expect(page).to_not have_content new_site.name
  end
end
