require 'rails_helper'

feature 'visits homepage', %Q{
  As a guest, I want to visit the homepage and see a list of top rated places to work.
  So that I can decide where to work today.

  Acceptance Criteria:
  -[ ]- I see the title of the website
  -[ ]- I see a list of the top ten sites in descending order
  } do
    scenario "visits homepage" do

      visit root_path
      expect(page).to have_content "Sites"
    end
  end
