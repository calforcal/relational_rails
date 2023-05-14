require "rails_helper"

RSpec.describe "Updating a Service Request" do
  before(:each) do
    @bikeshop = Bikeshop.create!(name: "UBikes", employees: 25, rewards_program: false)
    @servicerequest = Servicerequest.create!(bike_from_shop: true, estimated_cost: 200, customer_name: "Michael Callahan", bike_type: "Road", bikeshop_id: @bikeshop.id)
    @servicerequest2 = Servicerequest.create!(bike_from_shop: false, estimated_cost: 40, customer_name: "Primoz Roglic", bike_type: "Road", bikeshop_id: @bikeshop.id)
  end

  scenario "should be able to update an existing Service Request" do
    visit "/servicerequests/#{@servicerequest.id}"

    expect(page.has_link?).to be(true)
    expect(page).to have_content("Update Service Request")

    click_link("Update Service Request")

    fill_in "servicerequest[customer_name]", with: 'Request is Updated'
    fill_in "servicerequest[bike_type]", with: 'Unicycle'
    fill_in "servicerequest[estimated_cost]", with: 100
    fill_in "servicerequest[bike_from_shop]", with: false
    click_on("submit")

    expect(page).to have_current_path("/servicerequests/#{@servicerequest.id}")

    expect(page).to have_content("Request is Updated")
    expect(page).to have_content("Bike Type: Unicycle")
    expect(page).to have_content("Customer ID: #{@servicerequest.id}")
    expect(page).to have_content("Estimated Cost: 100")
    expect(page).to have_content("Bike from Shop: false")
  end
end