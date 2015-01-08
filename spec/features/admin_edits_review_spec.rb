require "rails_helper"

feature "Admin deletes and edits reviews", %{
  As admin I want to edit or delete a review
  } do

    # Acceptance Criteria:
    # - When I delete the review, it no longer appears in the review's view
    #   an error message
    #- When I edit the review's details, the updated details
    # are shown on the review's page

    let(:user) do
      FactoryGirl.create(:user, role: 2)
    end

    let(:new_review) do
      FactoryGirl.create(:review)
    end

    scenario "admin edits review's details" do
      sign_in_as(user)
      visit site_path(new_review.site)

      click_on "Edit Review"
      fill_in "review[comment]", with: "This is a review"
      select(5, from: "review[rating]")
      click_on "Update Review"
      expect(page).to have_content "This is a review"
    end

    scenario "admin deletes review" do
      sign_in_as(user)
      visit site_path(new_review.site)

      click_on "Delete"
      expect(page).to_not have_content new_review.comment
    end
  end
