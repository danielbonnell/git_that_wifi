require "rails_helper"

feature "User deletes a review", %{
  As a user,
  I want to delete a review I created,
  So that I can remove outdated information.

  Acceptance Criteria:
  [ ] I can delete my review when i am signed in
  [ ] I should not see a delete button if i am signed out
  [ ] I should not see a delete button if i did not create the review

} do
  let :site do
    FactoryGirl.create(:site)
  end
  scenario "User delete a review they created" do
    user = FactoryGirl.create(:user)

    visit new_user_session_path

    fill_in "Email", with: user.email
    fill_in "Password", with: user.password

    click_button "Sign in"

    visit site_path(site)

    click_on "Add a Review"

    select "5", from: "Rating"

    click_on "Submit"

    expect(page).to have_content "Delete"

    click_on "Delete"

    expect(page).to have_content "Review Deleted Successfully"
  end
  scenario "User should not see delete button if signed out" do
    user = FactoryGirl.create(:user)

    visit new_user_session_path

    fill_in "Email", with: user.email
    fill_in "Password", with: user.password

    click_button "Sign in"

    visit site_path(site)

    click_on "Add a Review"

    select "5", from: "Rating"

    click_on "Submit"

    click_on "Sign Out"

    visit site_path(site)

    expect(page).to_not have_content "Delete"
  end
  scenario "User should not see delete button if they do not own the review" do
    user = FactoryGirl.create(:user)

    visit new_user_session_path

    fill_in "Email", with: user.email
    fill_in "Password", with: user.password

    click_button "Sign in"

    visit site_path(site)

    click_on "Add a Review"

    select "5", from: "Rating"

    click_on "Submit"

    click_on "Sign Out"

    sign_in_as(site.user)

    expect(page).to_not have_content "Delete"
  end
end
