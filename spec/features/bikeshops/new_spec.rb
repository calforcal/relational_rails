require "rails_helper"

RSpec.describe "Creating a new Bikeshop" do
  before(:each) do
    @bikeshop = Bikeshop.create!(name: "UBikes", employees: 25, rewards_program: false)
    @bikeshop_2 = Bikeshop.create!(name: "Full Cycle", employees: 45, rewards_program: true)
  end

  scenario "should create a new Bikeshop" do
    visit "/bikeshops"

    expect(page.has_link?).to be(true)
    expect(page).to have_content("New Bike Shop")

    click_link("New Bike Shop")

    fill_in "bikeshop[name]", with: 'Newly Created Shop'
    fill_in "bikeshop[employees]", with: '5'
    fill_in "bikeshop[rewards_program]", with: 'false'
    click_on("submit")

    expect(page).to have_current_path("/bikeshops")

    expect(page).to have_content("Newly Created Shop")
  end
end