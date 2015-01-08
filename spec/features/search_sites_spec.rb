require "rails_helper"

feature "search movies" do
  scenario "fill in search form and view results" do
    cafe = FactoryGirl.create(:site, name: "Cafe Nero")
    cafe2 = FactoryGirl.create(:site, name: "Cafe Starbucks")
    cafe3 = FactoryGirl.create(:site, name: "Dunkin")

    visit sites_path
    fill_in "query", with: "Cafe"
    click_button "Search Sites"

    expect(page).to have_link("Cafe Nero", href: site_path(cafe))
    expect(page).to have_link("Cafe Starbucks", href: site_path(cafe2))
    expect(page).to_not have_content(cafe3.name)
  end
end
