class BikeshopServicerequestsController < ApplicationController

  def index
    @bikeshop = Bikeshop.find(params[:id])
    @servicerequests = @bikeshop.servicerequests
    if params[:sorted] == "true"
      @servicerequests = @servicerequests.alphabetical_sort
    elsif :cost_filter
      num = :cost_filter
      @servicerequests = @servicerequests.limit_by_estimated_cost(params[:cost_filter])
    else
      @servicerequests
    end
  end
end