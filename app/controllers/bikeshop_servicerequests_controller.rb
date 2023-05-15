class BikeshopServicerequestsController < ApplicationController

  def index
    @bikeshop = Bikeshop.find(params[:id])
    @servicerequests = @bikeshop.servicerequests
  end
end