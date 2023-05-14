require "rails_helper"

RSpec.describe "Updating a Bikeshop" do
  before(:each) do
    @bikeshop = Bikeshop.create!(name: "UBikes", employees: 25, rewards_program: false)
    @bikeshop_2 = Bikeshop.create!(name: "Full Cycle", employees: 45, rewards_program: true)
  end

  scenario "should be able to update an existing Bikeshop" do
    visit "/bikeshops/#{@bikeshop.id}"

    expect(page.has_link?).to be(true)
    expect(page).to have_content("Update Shop")

    click_link("Update Shop")

    fill_in "bikeshop[name]", with: 'Shop is Updated'
    fill_in "bikeshop[employees]", with: '100'
    fill_in "bikeshop[rewards_program]", with: 'true'
    click_on("submit")

    expect(page).to have_current_path("/bikeshops/#{@bikeshop.id}")

    expect(page).to have_content("Shop is Updated")
    expect(page).to have_content("Bike Shop ID: #{@bikeshop.id}")
    expect(page).to have_content("Number of Employees: 100")
    expect(page).to have_content("Rewards Program: true")
  end
end