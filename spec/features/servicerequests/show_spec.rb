require "rails_helper"

RSpec.describe "the Service Requests show page" do
  it "shows the specific service request and its attributes" do
    bikeshop = Bikeshop.create!(name: "UBikes", employees: 25, rewards_program: false)
    service_request_1 = Servicerequest.create!(bike_from_shop: true, estimated_cost: 200, customer_name: "Michael Callahan", bike_type: "Road")
    service_request_2 = Servicerequest.create!(bike_from_shop: false, estimated_cost: 40, customer_name: "Primoz Roglic", bike_type: "Road")

    
  end
end