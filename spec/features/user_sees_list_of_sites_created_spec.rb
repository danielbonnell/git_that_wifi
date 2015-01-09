require "rails_helper"

feature "user sees lists of sites created", %{
  As a user, I want to see a list of sites I created,
  So that I can easily access those sites

  Acceptance Criteria:
  -[ ] If i have created any sites, i should see a list of those on my profile
  -[ ] If i have not created any sites, I should see a link to create a site
  } do

    let(:user) do
      FactoryGirl.create(:user)
    end

    scenario "visit your account detail see list of sites created" do
      site1 = FactoryGirl.create(:site, name: "Site one", user: user)
      site2 = FactoryGirl.create(:site, name: "Site two", user: user)
      sign_in_as(user)
      visit user_path(user)

      expect(page).to have_content site1.name
      expect(page).to have_content site2.name

    end
end
