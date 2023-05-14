require "rails_helper"

RSpec.describe "Creating a new Service Request for a BikeShop" do
  before(:each) do
    @bikeshop = Bikeshop.create!(name: "UBikes", employees: 25, rewards_program: false)
    @bikeshop_2 = Bikeshop.create!(name: "Full Cycle", employees: 45, rewards_program: true)
  end

  scenario "should create a new service request" do
    visit "/bikeshops/#{@bikeshop.id}/servicerequests"

    expect(page.has_link?).to be(true)
    expect(page).to have_content("Create Service Request")

    click_link("Create Service Request")
    expect(page).to have_current_path("/bikeshops/#{@bikeshop.id}/servicerequests/new")

    fill_in "servicerequest[bike_from_shop]", with: true
    fill_in "servicerequest[estimated_cost]", with: 100
    fill_in "servicerequest[customer_name]", with: 'Test Test'
    fill_in "servicerequest[bike_type]", with: "Road"
    click_on("submit")

    expect(page).to have_current_path("/bikeshops/#{@bikeshop.id}/servicerequests")

    expect(page).to have_content("Customer Name: Test Test")
    expect(page).to have_content("Bike Type: Road")
    expect(page).to have_content("Estimated Cost: 100")
    expect(page).to have_content("Bike from Shop: true")
    expect(page).to have_content("Customer ID:")

    visit "/servicerequests"

    expect(page).to have_content("Customer Name: Test Test")
    expect(page).to have_content("Bike Type: Road")
    expect(page).to have_content("Estimated Cost: 100")
    expect(page).to have_content("Bike from Shop: true")
    expect(page).to have_content("Customer ID:")
    expect(page).to have_content("Shop ID:")
  end
end