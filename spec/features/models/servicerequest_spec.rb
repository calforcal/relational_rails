require "rails_helper"

RSpec.describe Servicerequest, type: :model do
  it{should belong_to :bikeshop}

  describe "#methods" do
    before(:each) do
      @bikeshop = Bikeshop.create!(name: "UBikes", employees: 25, rewards_program: false)
      @service_request_1 = @bikeshop.servicerequests.create!(bike_from_shop: true, estimated_cost: 200, customer_name: "Michael Callahan", bike_type: "Road", bikeshop_id: @bikeshop.id)
      @service_request_2 = @bikeshop.servicerequests.create!(bike_from_shop: false, estimated_cost: 40, customer_name: "Primoz Roglic", bike_type: "Road", bikeshop_id: @bikeshop.id)
      @service_request_3 = @bikeshop.servicerequests.create!(bike_from_shop: true, estimated_cost: 120, customer_name: "Alfred Pidcock", bike_type: "MTB", bikeshop_id: @bikeshop.id)
    end

    describe "#self.filter_bike_from_shop" do
      it "filters out bikes NOT bougt from the associated shop (FALSE-y values)" do
        expected = [@service_request_1, @service_request_2, @service_request_3]

        expect(Servicerequest.all).to eq(expected)
        
        filtered_expected = [@service_request_1, @service_request_3]

        expect(Servicerequest.all.filter_bike_from_shop).to eq(filtered_expected)
      end
    end

    describe "self.alphabetical_sort" do
      it "can order service requests alphabetically by customer_name" do
        expected = [@service_request_1, @service_request_2, @service_request_3]

        expect(Servicerequest.all).to eq(expected)

        filtered_expected = [@service_request_3, @service_request_1, @service_request_2]

        expect(Servicerequest.all.alphabetical_sort).to eq(filtered_expected)
      end
    end
  end
end