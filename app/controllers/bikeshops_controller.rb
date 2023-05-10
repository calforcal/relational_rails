class BikeshopsController < ApplicationController
  def index
    @bikeshops = Bikeshop.all
  end
end