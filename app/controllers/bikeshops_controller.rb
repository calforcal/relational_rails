class BikeshopsController < ApplicationController
  def index
    @bikeshops = Bikeshop.all
  end

  def show
    @bikeshop = Bikeshop.find(params[:id])
  end
end