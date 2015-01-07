require "rails_helper"

feature "visits homepage", %{
  As a guest, I want to visit the homepage and see a list of top rated places
  to work, so that I can decide where to work today.

  Acceptance Criteria:
  - [ ] I see the title of the website
  - [ ] I see a list of the top ten sites in descending order
  } do

  let(:user) do
    FactoryGirl.create(:user)
  end


  scenario "visits homepage" do
    site1 = FactoryGirl.create(:site)
    site2 = FactoryGirl.create(:site)
    
    visit root_path

    site1_index = page.body.index(site1.name)
    site2_index = page.body.index(site2.name)

    expect(site2_index).to be < site1_index
  end
end
