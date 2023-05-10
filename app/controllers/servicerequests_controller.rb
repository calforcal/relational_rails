class ServicerequestsController < ApplicationController
  def index
    @servicerequests = Servicerequest.all
  end
end