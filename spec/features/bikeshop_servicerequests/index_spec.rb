require "rails_helper"

RSpec.describe "Bikeshops' Service Requests" do
  before(:each) do
    @bikeshop = Bikeshop.create!(name: "UBikes", employees: 25, rewards_program: false)
    @service_request_1 = Servicerequest.create!(bike_from_shop: true, estimated_cost: 200, customer_name: "Michael Callahan", bike_type: "Road", bikeshop_id: @bikeshop.id)
    @service_request_2 = Servicerequest.create!(bike_from_shop: true, estimated_cost: 40, customer_name: "Primoz Roglic", bike_type: "Road", bikeshop_id: @bikeshop.id)
    @service_request_3 = Servicerequest.create!(bike_from_shop: true, estimated_cost: 120, customer_name: "Alfred Pidcock", bike_type: "MTB", bikeshop_id: @bikeshop.id)

    @bikeshop_2 = Bikeshop.create!(name: "Full Cycle", employees: 45, rewards_program: true)
    @service_request_4 = Servicerequest.create!(bike_from_shop: true, estimated_cost: 70, customer_name: "Tadej Pogacar", bike_type: "Fixie", bikeshop_id: @bikeshop_2.id)
    @service_request_5 = Servicerequest.create!(bike_from_shop: true, estimated_cost: 250, customer_name: "Joao Almeida", bike_type: "Road", bikeshop_id: @bikeshop_2.id)
  end
  it "displays a particular bikeshops service requests" do

    visit "/bikeshops/#{@bikeshop.id}/servicerequests"

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

    expect(page).to_not have_content("Customer ID: #{@service_request_4.id}")
    expect(page).to_not have_content("Customer Name: #{@service_request_4.customer_name}")
    expect(page).to_not have_content("Estimated Cost: #{@service_request_4.estimated_cost}")

    expect(page).to_not have_content("Customer ID: #{@service_request_5.id}")
    expect(page).to_not have_content("Customer Name: #{@service_request_5.customer_name}")
    expect(page).to_not have_content("Estimated Cost: #{@service_request_5.estimated_cost}")
  end

  it "displays a link to the Service Requests Index Page" do

    visit "/bikeshops/#{@bikeshop.id}/servicerequests"

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

    visit "/bikeshops/#{@bikeshop.id}/servicerequests"

    expect(page.has_link?).to be(true)
    expect(page).to have_content("All Bike Shops")

    click_link("All Bike Shops")

    expect(page).to have_content("#{@bikeshop.name}")
    expect(page).to have_content("#{@bikeshop_2.name}")
  end

  it "can sort service requests alphabetically when link is clicked" do
    visit "/bikeshops/#{@bikeshop.id}/servicerequests"

    expect(@service_request_1.customer_name).to appear_before(@service_request_2.customer_name)
    expect(@service_request_2.customer_name).to appear_before(@service_request_3.customer_name)

    expect(page.has_link?).to be(true)
    expect(page).to have_content("Alphabetical")
    click_link("Alphabetical")

    expect(@service_request_3.customer_name).to appear_before(@service_request_1.customer_name)
    expect(@service_request_1.customer_name).to appear_before(@service_request_2.customer_name)
  end

  it "can take an input and filter records based on estimated cost" do
    visit "/bikeshops/#{@bikeshop.id}/servicerequests"

    expect(page).to have_content("Customer Name: #{@service_request_1.customer_name}")
    expect(page).to have_content("Customer Name: #{@service_request_2.customer_name}")
    expect(page).to have_content("Customer Name: #{@service_request_3.customer_name}")

    expect(page.has_field? "cost_filter").to be(true)
    expect(page.has_button? "Only return records with more than Estimated Cost").to be(true)

    fill_in :cost_filter, with: 150
    click_button("Only return records with more than Estimated Cost")

    expect(page).to have_content("Customer Name: #{@service_request_1.customer_name}")
    expect(page).to_not have_content("Customer Name: #{@service_request_2.customer_name}")
    expect(page).to_not have_content("Customer Name: #{@service_request_3.customer_name}")
  end
end