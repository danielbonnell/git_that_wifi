require "rails_helper"

feature "User updates a review that they created", %{
  As a user,
  I want to be able to update a review,
  So it can have the most up to date information.

  Acceptance Criteria:
  [ ] I must own the review I am trying to edit.
  [ ] When a review is updated successfully, I see a success message
  [ ] When I am unsuccessful, I se an error message

} do
  let :site do
    FactoryGirl.create(:site)
  end

  scenario "User updates a review they own" do
    user = FactoryGirl.create(:user)

    visit new_user_session_path

    fill_in "Email", with: user.email
    fill_in "Password", with: user.password

    click_button "Sign in"

    visit site_path(site)

    click_on "Add a Review"

    select "5", from: "Rating"

    click_on "Submit"

    expect(page).to have_content "Edit Review"

    click_on "Edit Review"

    fill_in "Comment", with: "Awesome place!"

    click_button "Update Review"

    expect(page).to have_content "Review Updated Successfully"
    expect(page).to have_content "Awesome place!"
  end
  scenario "User Should not be able to update a review they dont own" do
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

    expect(page).to_not have_content "Edit Review"
  end
end
