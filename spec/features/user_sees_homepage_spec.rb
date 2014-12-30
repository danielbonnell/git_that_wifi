require "rails_helper"

feature "visits homepage", %q{
  As a guest, I want to visit the homepage and see a list of top rated places
  to work, so that I can decide where to work today.

  Acceptance Criteria:
  - [ ] I see the title of the website
  - [ ] I see a list of the top ten sites in descending order
  } do

  let(:user) do
    FactoryGirl.create(:user)
  end

  let!(:sites) do
    list = []
    10.times { list << FactoryGirl.create(:site, user: user) }
    list
  end

  let(:site) do
    sites.last
  end

  scenario "visits homepage" do
    visit root_path

    within "table.sites tbody tr:nth-child(1)" do
      expect(page).to have_content(site.cost_rating)
    end
  end
end
