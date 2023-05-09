class BikeshopsController < ApplicationController
  def bikeshops_index
    @bikeshops = ["UBikes", "Full Cycle", "Community Cycles"]
  end
end