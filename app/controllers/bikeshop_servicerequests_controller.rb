class BikeshopServicerequestsController < ApplicationController

  def index
    @bikeshop = Bikeshop.find(params[:id])
    @servicerequests = @bikeshop.servicerequests
  end

  def new
    @bikeshop = Bikeshop.find(params[:id])
  end

  def create
    @bikeshop = Bikeshop.find(params[:id])
    service_request = Servicerequest.new({
      bike_from_shop: params[:servicerequest][:bike_from_shop],
      estimated_cost: params[:servicerequest][:estimated_cost],
      customer_name: params[:servicerequest][:customer_name],
      bike_type: params[:servicerequest][:bike_type],
      bikeshop_id: @bikeshop.id
    })
    service_request.save
    redirect_to "/bikeshops/#{@bikeshop.id}/servicerequests"
  end
end