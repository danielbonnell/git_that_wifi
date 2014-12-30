require "rails_helper"

feature "sees the details of a site", %q{
  As a guest, I want to view the details of a site, so that
  I can decide if it meets my criteria for a work site

  Acceptance Criteria:
  - [ ] Must see the name of the site
  - [ ] Must see the location of the site
  - [ ] Must see user generated reviews (if any) (optional)
  - [ ] Must see photos (if any)(optional)
  - [ ] Must have at least one category
  - [ ] Must see description
  - [ ] Must see phone number (if any)
  - [ ] Must see website url (if any)(optional)
  - [ ] Must see days open (optional)
  - [ ] Must see open time (optional)
  - [ ] Must see close time (optional)
  - [ ] Must see cost rating (optional)
  - [ ] Must see username that created site
  } do

  let (:test_site) do
    FactoryGirl.create(:site)
  end

  scenario "sees the name of the site" do
    visit site_path(test_site)

    expect(page).to have_content test_site.name
  end

  scenario "sees the location of the site" do
    visit site_path(test_site)

    expect(page).to have_content test_site.address
    expect(page).to have_content test_site.city
    expect(page).to have_content test_site.state
    expect(page).to have_content test_site.zip
  end

  # scenario "has a rating" do
  #   visit site_path(test_site)
  #
  #   expect(page).to have_content test_site.rating
  # end

  # scenario "sees user generated reviews (if any)" do
  #   visit site_path(test_site)
  #
  #   expect(page).to have_content ""
  # end

  # scenario "sees photos (if any)" do
  #   visit site_path(test_site)
  #
  #   expect(page).to have_content ""
  # end

  # scenario "has at least one category" do
  #   visit site_path(test_site)
  #
  #   expect(page).to have_content ""
  # end

  scenario "sees description" do
    visit site_path(test_site)

    expect(page).to have_content test_site.description
  end

  scenario "sees phone number (if any)" do
    visit site_path(test_site)

    expect(page).to have_content test_site.phone
  end

  scenario "sees website url (if any)" do
    visit site_path(test_site)

    expect(page).to have_content test_site.url
  end

  scenario "sees days open" do
    visit site_path(test_site)

    expect(page).to have_content test_site.days_open
  end

  scenario "sees open time" do
    visit site_path(test_site)

    expect(page).to have_content test_site.open_time
  end

  scenario "sees close time" do
    visit site_path(test_site)

    expect(page).to have_content test_site.close_time
  end

  scenario "sees cost rating" do
    visit site_path(test_site)

    expect(page).to have_content test_site.cost_rating
  end

  # scenario "sees username that created site" do
  #   visit site_path(test_site)
  #
  #   expect(page).to have_content ""
  # end

end
