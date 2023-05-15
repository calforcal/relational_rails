class BikeshopServicerequestsController < ApplicationController

  def index
    @bikeshop = Bikeshop.find(params[:id])
    @servicerequests = @bikeshop.servicerequests
    if params[:sorted] == "true"
      @servicerequests = @servicerequests.alphabetical_sort
    else
      @servicerequests
    end
  end
end