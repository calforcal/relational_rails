require "rails_helper"

RSpec.describe Bikeshop, type: :model do
  it{should have_many :servicerequests}
  
  describe "#methods" do  
    before(:each) do
      @bikeshop = Bikeshop.create!(name: "UBikes", employees: 25, rewards_program: false)
      @bikeshop_2 = Bikeshop.create!(name: "Full Cycle", employees: 45, rewards_program: true)
      @bikeshop_3 = Bikeshop.create!(name: "Community Cycles", employees: 10, rewards_program: false)
      @service_request_1 = @bikeshop.servicerequests.create!(bike_from_shop: true, estimated_cost: 200, customer_name: "Michael Callahan", bike_type: "Road", bikeshop_id: @bikeshop.id)
      @service_request_2 = @bikeshop.servicerequests.create!(bike_from_shop: false, estimated_cost: 40, customer_name: "Primoz Roglic", bike_type: "Road", bikeshop_id: @bikeshop.id)
      @service_request_3 = @bikeshop.servicerequests.create!(bike_from_shop: true, estimated_cost: 120, customer_name: "Thomas Pidcock", bike_type: "MTB", bikeshop_id: @bikeshop.id)
    end

    describe "#request_count" do
      it "can determine the amount of requests associated with a bikeshop" do
        expect(@bikeshop.request_count).to eq(3)
      end
    end

    describe "#self.order_shops" do
      it "can order the bikeshops with the newest created first" do
        expected = [@bikeshop_3, @bikeshop_2, @bikeshop]

        expect(Bikeshop.all.order_shops).to eq(expected)
      end
    end
  end
end