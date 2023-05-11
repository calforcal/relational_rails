require "rails_helper"

RSpec.describe "the bikeshops show page" do
  it "displays the attributes of the selected bike shop" do
    bikeshop_1 = Bikeshop.create!(name: "UBikes", employees: 25, rewards_program: false)
    bikeshop_2 = Bikeshop.create!(name: "Full Cycle", employees: 40, rewards_program: true)

    visit "/bikeshops/#{bikeshop_1.id}"

    expect(page).to have_content(bikeshop_1.name)
    expect(page).to have_content("Bike Shop ID: #{bikeshop_1.id}")
    expect(page).to have_content("Number of Employees: #{bikeshop_1.employees}")
    expect(page).to have_content("Rewards Program: #{bikeshop_1.rewards_program}")
    expect(page).to have_content("Created At: #{bikeshop_1.created_at}")
    expect(page).to have_content("Updated At: #{bikeshop_1.updated_at}")
  end

  it "displays the number of service requests associated with the bike shop" do
    bikeshop = Bikeshop.create!(name: "UBikes", employees: 25, rewards_program: false)
    service_request_1 = Servicerequest.create!(bike_from_shop: true, estimated_cost: 200, customer_name: "Michael Callahan", bike_type: "Road", bikeshop_id: bikeshop.id)
    service_request_2 = Servicerequest.create!(bike_from_shop: false, estimated_cost: 40, customer_name: "Primoz Roglic", bike_type: "Road", bikeshop_id: bikeshop.id)
    service_request_3 = Servicerequest.create!(bike_from_shop: true, estimated_cost: 120, customer_name: "Thomas Pidcock", bike_type: "MTB", bikeshop_id: bikeshop.id)

    visit "/bikeshops/#{bikeshop.id}"

    expect(page).to have_content("Service Requests: 3")
  end
end