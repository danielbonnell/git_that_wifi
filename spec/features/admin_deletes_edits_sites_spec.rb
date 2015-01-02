# require "rails_helper"
#
# feature "Admin deletes and edits sites", %{
# As admin I want to edit or delete a site
# } do
#
# # Acceptance Criteria:
# # - When I delete the site, it no longer appears in the site's view
# #   an error message
# #- When I edit the site's details, the updated details
# # are shown on the site's page
#
#   let(:user) do
#     FactoryGirl.create(:user)
#   end
#
#   let(:new_site) do
#     FactoryGirl.create(:site, name: "Site name", user: user)
#   end
#
#   scenario "admin visits site's details" do
#     sign_in_as(user)
#     visit site_path(new_site)
#     click_on "Edit"
#     fill_in "site[description]", with: "This is a description"
#     click_on "Submit"
#     expect(page).to have_content "This is a description"
#   end
#
#   scenario "admin deletes site" do
#     sign_in_as(user)
#     visit site_path(new_site)
#
#     click_on "Delete"
#     expect(page).to_not have_content "Site name"
#   end
# end
