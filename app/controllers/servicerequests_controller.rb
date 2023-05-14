class ServicerequestsController < ApplicationController
  def index
    @servicerequests = Servicerequest.all
  end

  def show
    @servicerequest = Servicerequest.find(params[:id])
  end

  def edit
    @servicerequest = Servicerequest.find(params[:id])
  end

  def update
    request = Servicerequest.find(params[:id])
    request.update({
      customer_name: params[:servicerequest][:customer_name],
      bike_type: params[:servicerequest][:bike_type],
      estimated_cost: params[:servicerequest][:estimated_cost],
      bike_from_shop: params[:servicerequest][:bike_from_shop]
    })
    request.save
    redirect_to "/servicerequests/#{request.id}"
  end
end