require "rails_helper"

RSpec.describe "the Service Requests show page" do
  it "shows the specific service request and its attributes" do
    bikeshop = Bikeshop.create!(name: "UBikes", employees: 25, rewards_program: false)
    service_request_1 = Servicerequest.create!(bike_from_shop: true, estimated_cost: 200, customer_name: "Michael Callahan", bike_type: "Road", bikeshop_id: bikeshop.id)
    service_request_2 = Servicerequest.create!(bike_from_shop: false, estimated_cost: 40, customer_name: "Primoz Roglic", bike_type: "Road", bikeshop_id: bikeshop.id)

    visit "/servicerequests/#{service_request_2.id}"

    expect(page).to have_content("Customer ID: #{service_request_2.id}")
    expect(page).to have_content("Customer Name: #{service_request_2.customer_name}")
    expect(page).to have_content("Bike Type: #{service_request_2.bike_type}")
    expect(page).to have_content("Estimated Cost: #{service_request_2.estimated_cost}")
    expect(page).to have_content("Bike from Shop: #{service_request_2.bike_from_shop}")

    expect(page).to_not have_content("Customer ID: #{service_request_1.id}")
    expect(page).to_not have_content("Customer Name: #{service_request_1.customer_name}")
    expect(page).to_not have_content("Estimated Cost: #{service_request_1.estimated_cost}")
    expect(page).to_not have_content("Bike from Shop: #{service_request_1.bike_from_shop}")
  end
end