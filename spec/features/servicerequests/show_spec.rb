require "rails_helper"

RSpec.describe "the Service Requests show page" do
  before(:each) do
    @bikeshop = Bikeshop.create!(name: "UBikes", employees: 25, rewards_program: false)
    @service_request_1 = Servicerequest.create!(bike_from_shop: true, estimated_cost: 200, customer_name: "Michael Callahan", bike_type: "Road", bikeshop_id: @bikeshop.id)
    @service_request_2 = Servicerequest.create!(bike_from_shop: true, estimated_cost: 40, customer_name: "Primoz Roglic", bike_type: "Road", bikeshop_id: @bikeshop.id)
    @service_request_3 = Servicerequest.create!(bike_from_shop: true, estimated_cost: 120, customer_name: "Thomas Pidcock", bike_type: "MTB", bikeshop_id: @bikeshop.id)

    @bikeshop_2 = Bikeshop.create!(name: "Full Cycle", employees: 45, rewards_program: true)
    @service_request_4 = Servicerequest.create!(bike_from_shop: true, estimated_cost: 70, customer_name: "Tadej Pogacar", bike_type: "Fixie", bikeshop_id: @bikeshop_2.id)
    @service_request_5 = Servicerequest.create!(bike_from_shop: true, estimated_cost: 250, customer_name: "Joao Almeida", bike_type: "Road", bikeshop_id: @bikeshop_2.id)
  end

  it "shows the specific service request and its attributes" do

    visit "/servicerequests/#{@service_request_2.id}"

    expect(page).to have_content("Customer ID: #{@service_request_2.id}")
    expect(page).to have_content("Customer Name: #{@service_request_2.customer_name}")
    expect(page).to have_content("Bike Type: #{@service_request_2.bike_type}")
    expect(page).to have_content("Estimated Cost: #{@service_request_2.estimated_cost}")
    expect(page).to have_content("Bike from Shop: #{@service_request_2.bike_from_shop}")

    expect(page).to_not have_content("Customer ID: #{@service_request_1.id}")
    expect(page).to_not have_content("Customer Name: #{@service_request_1.customer_name}")
    expect(page).to_not have_content("Estimated Cost: #{@service_request_1.estimated_cost}")
  end

  it "displays a link to the Service Requests Index Page" do

    visit "/servicerequests/#{@service_request_1.id}"

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

    visit "/servicerequests/#{@service_request_1.id}"

    expect(page.has_link?).to be(true)
    expect(page).to have_content("All Bike Shops")

    click_link("All Bike Shops")

    expect(page).to have_content("#{@bikeshop.name}")
    expect(page).to have_content("#{@bikeshop_2.name}")
  end

  it "displays a button to delete that service request" do
    delete_bikeshop = Bikeshop.create!(name: "UBikes", employees: 25, rewards_program: false)
    delete_request = Servicerequest.create!(bike_from_shop: true, estimated_cost: 200, customer_name: "Deleting This", bike_type: "Delete!", bikeshop_id: delete_bikeshop.id)

    visit "/servicerequests"

    expect(page).to have_content(delete_request.customer_name)
    expect(page).to have_content("Customer ID: #{delete_request.id}")
    expect(page).to have_content(@service_request_1.customer_name)

    visit "/servicerequests/#{delete_request.id}"
    
    expect(page.has_button?).to be(true)
    expect(page).to have_button("Delete Service Request")
    
    click_button("Delete Service Request")

    expect(current_path).to eq("/servicerequests")    
    expect(page).to_not have_content(delete_request.customer_name)
    expect(page).to_not have_content("Shop ID: #{delete_request.id}")

    expect(page).to have_content(@service_request_1.customer_name)
  end
end