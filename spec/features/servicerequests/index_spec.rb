require "rails_helper"

RSpec.describe "the Service Requests index page" do
  before(:each) do
    @bikeshop = Bikeshop.create!(name: "UBikes", employees: 25, rewards_program: false)
    @service_request_1 = Servicerequest.create!(bike_from_shop: true, estimated_cost: 200, customer_name: "Michael Callahan", bike_type: "Road", bikeshop_id: @bikeshop.id)
    @service_request_2 = Servicerequest.create!(bike_from_shop: true, estimated_cost: 40, customer_name: "Primoz Roglic", bike_type: "Road", bikeshop_id: @bikeshop.id)
    @service_request_3 = Servicerequest.create!(bike_from_shop: true, estimated_cost: 120, customer_name: "Thomas Pidcock", bike_type: "MTB", bikeshop_id: @bikeshop.id)

    @bikeshop_2 = Bikeshop.create!(name: "Full Cycle", employees: 45, rewards_program: true)
    @service_request_4 = Servicerequest.create!(bike_from_shop: true, estimated_cost: 70, customer_name: "Tadej Pogacar", bike_type: "Fixie", bikeshop_id: @bikeshop_2.id)
    @service_request_5 = Servicerequest.create!(bike_from_shop: true, estimated_cost: 250, customer_name: "Joao Almeida", bike_type: "Road", bikeshop_id: @bikeshop_2.id)
  end

  it "displays all of the service requests and their attributes" do

    visit "/servicerequests"

    expect(page).to have_content("Customer ID: #{@service_request_1.id}")
    expect(page).to have_content("Customer Name: #{@service_request_1.customer_name}")
    expect(page).to have_content("Bike Type: #{@service_request_1.bike_type}")
    expect(page).to have_content("Estimated Cost: #{@service_request_1.estimated_cost}")
    expect(page).to have_content("Bike from Shop: #{@service_request_1.bike_from_shop}")
    
    expect(page).to have_content("Customer ID: #{@service_request_2.id}")
    expect(page).to have_content("Customer Name: #{@service_request_2.customer_name}")
    expect(page).to have_content("Bike Type: #{@service_request_2.bike_type}")
    expect(page).to have_content("Estimated Cost: #{@service_request_2.estimated_cost}")
    expect(page).to have_content("Bike from Shop: #{@service_request_2.bike_from_shop}")

    expect(page).to have_content("Customer ID: #{@service_request_3.id}")
    expect(page).to have_content("Customer Name: #{@service_request_3.customer_name}")
    expect(page).to have_content("Bike Type: #{@service_request_3.bike_type}")
    expect(page).to have_content("Estimated Cost: #{@service_request_3.estimated_cost}")
    expect(page).to have_content("Bike from Shop: #{@service_request_3.bike_from_shop}")
  end

  it "displays a link to the Service Requests Index Page" do

    visit "/servicerequests"

    expect(page.has_link?).to be(true)
    expect(page).to have_content("All Service Requests")

    click_link("All Service Requests")

    expect(page).to have_content("Customer ID: #{@service_request_1.id}")
    expect(page).to have_content("Customer Name: #{@service_request_1.customer_name}")
    expect(page).to have_content("Bike Type: #{@service_request_1.bike_type}")
    expect(page).to have_content("Estimated Cost: #{@service_request_1.estimated_cost}")
    expect(page).to have_content("Bike from Shop: #{@service_request_1.bike_from_shop}")
    
    expect(page).to have_content("Customer ID: #{@service_request_2.id}")
    expect(page).to have_content("Customer Name: #{@service_request_2.customer_name}")
    expect(page).to have_content("Bike Type: #{@service_request_2.bike_type}")
    expect(page).to have_content("Estimated Cost: #{@service_request_2.estimated_cost}")
    expect(page).to have_content("Bike from Shop: #{@service_request_2.bike_from_shop}")

    expect(page).to have_content("Customer ID: #{@service_request_3.id}")
    expect(page).to have_content("Customer Name: #{@service_request_3.customer_name}")
    expect(page).to have_content("Bike Type: #{@service_request_3.bike_type}")
    expect(page).to have_content("Estimated Cost: #{@service_request_3.estimated_cost}")
    expect(page).to have_content("Bike from Shop: #{@service_request_3.bike_from_shop}")

    expect(page).to have_content("Customer ID: #{@service_request_4.id}")
    expect(page).to have_content("Customer Name: #{@service_request_4.customer_name}")
    expect(page).to have_content("Estimated Cost: #{@service_request_4.estimated_cost}")

    expect(page).to have_content("Customer ID: #{@service_request_5.id}")
    expect(page).to have_content("Customer Name: #{@service_request_5.customer_name}")
    expect(page).to have_content("Estimated Cost: #{@service_request_5.estimated_cost}")
  end

  it "displays a link to the BikeShops Index Page" do

    visit "/servicerequests"

    expect(page.has_link?).to be(true)
    expect(page).to have_content("All Bike Shops")

    click_link("All Bike Shops")

    expect(page).to have_content("#{@bikeshop.name}")
    expect(page).to have_content("#{@bikeshop_2.name}")
  end

  it "displays a link to update each service request" do
    visit "/servicerequests"

    expect(page.has_link?).to be(true)
    expect(page).to have_content("Update Customer ID: #{@service_request_1.id} Service Request")
    click_link("Update Customer ID: #{@service_request_1.id} Service Request")

    expect(current_path).to eq("/servicerequests/#{@service_request_1.id}/edit")
    
    visit "/servicerequests"

    expect(page.has_link?).to be(true)
    expect(page).to have_content("Update Customer ID: #{@service_request_2.id} Service Request")
    click_link("Update Customer ID: #{@service_request_2.id} Service Request")

    expect(current_path).to eq("/servicerequests/#{@service_request_2.id}/edit")

    visit "/servicerequests"

    expect(page.has_link?).to be(true)
    expect(page).to have_content("Update Customer ID: #{@service_request_3.id} Service Request")
    click_link("Update Customer ID: #{@service_request_3.id} Service Request")

    expect(current_path).to eq("/servicerequests/#{@service_request_3.id}/edit")
    
    visit "/servicerequests"

    expect(page.has_link?).to be(true)
    expect(page).to have_content("Update Customer ID: #{@service_request_4.id} Service Request")
    click_link("Update Customer ID: #{@service_request_4.id} Service Request")

    expect(current_path).to eq("/servicerequests/#{@service_request_4.id}/edit")
    
    visit "/servicerequests"

    expect(page.has_link?).to be(true)
    expect(page).to have_content("Update Customer ID: #{@service_request_5.id} Service Request")
    click_link("Update Customer ID: #{@service_request_5.id} Service Request")

    expect(current_path).to eq("/servicerequests/#{@service_request_5.id}/edit")
  end

  it "displays a button to delete each service request" do

    visit "/servicerequests"

    expect(page).to have_button("Delete Customer ID: #{@service_request_1.id} Service Request")
    expect(page).to have_button("Delete Customer ID: #{@service_request_2.id} Service Request")
    expect(page).to have_button("Delete Customer ID: #{@service_request_3.id} Service Request")
    expect(page).to have_button("Delete Customer ID: #{@service_request_4.id} Service Request")
    expect(page).to have_button("Delete Customer ID: #{@service_request_5.id} Service Request")

    expect(page).to have_content("Customer ID: #{@service_request_1.id}")
    expect(page).to have_content("Customer Name: #{@service_request_1.customer_name}")
    
    expect(page).to have_content("Customer ID: #{@service_request_2.id}")
    expect(page).to have_content("Customer Name: #{@service_request_2.customer_name}")

    expect(page).to have_content("Customer ID: #{@service_request_3.id}")
    expect(page).to have_content("Customer Name: #{@service_request_3.customer_name}")

    expect(page).to have_content("Customer ID: #{@service_request_4.id}")
    expect(page).to have_content("Customer Name: #{@service_request_4.customer_name}")

    expect(page).to have_content("Customer ID: #{@service_request_5.id}")
    expect(page).to have_content("Customer Name: #{@service_request_5.customer_name}")

    click_button("Delete Customer ID: #{@service_request_1.id} Service Request")
    click_button("Delete Customer ID: #{@service_request_2.id} Service Request")

    expect(page).to_not have_content("Customer ID: #{@service_request_1.id}")
    expect(page).to_not have_content("Customer Name: #{@service_request_1.customer_name}")
    
    expect(page).to_not have_content("Customer ID: #{@service_request_2.id}")
    expect(page).to_not have_content("Customer Name: #{@service_request_2.customer_name}")

    expect(page).to have_content("Customer ID: #{@service_request_3.id}")
    expect(page).to have_content("Customer Name: #{@service_request_3.customer_name}")

    expect(page).to have_content("Customer ID: #{@service_request_4.id}")
    expect(page).to have_content("Customer Name: #{@service_request_4.customer_name}")

    expect(page).to have_content("Customer ID: #{@service_request_5.id}")
    expect(page).to have_content("Customer Name: #{@service_request_5.customer_name}")
  end
end