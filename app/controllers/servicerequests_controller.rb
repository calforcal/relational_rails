class ServicerequestsController < ApplicationController
  def index
    @servicerequests = Servicerequest.all
  end

  def show
    @servicerequest = Servicerequest.find(params[:id])
  end
end