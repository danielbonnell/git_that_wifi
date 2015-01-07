require "rails_helper"

feature "votes on review", %{
  As an authenticated user I want to vote on a review.
  I can change or delete my vote.
  I can only vote once per review
  Each review has a total number of votes.
  The reviews are ordered by the ones with
  the most votes.

  Acceptance Criteria:

  [ ] User is authenticated
  [ ] User votes on a review
  [ ] User can change their vote
  [ ] User deletes their vote
  [ ] Review has a total number of votes
  [ ] Reviews are ordered by most votes
  [ ] Users can only vote once per review


  } do

  let(:user) do
    FactoryGirl.create(:user)
  end

  let (:test_review) do
    FactoryGirl.create(:review)
  end

  let (:site) do
    FactoryGirl.create(:site)
  end

  scenario "User can up-vote a review " do
    sign_in_as(test_review.user)

    visit site_path(test_review.site)
    click_button "Upvote"

    expect(page).to have_content test_review.score
  end

  # scenario "User can down-vote a review " do
  # end

  # scenario "User can delete vote" do
  # end

  # scenario "User can change vote" do
  # end

  # scenario "User can only vote once per review" do
  # end

  # scenario "Votes on review are totaled" do
  # end

  # scenario "Votes on review are totaled" do
  # end

end
