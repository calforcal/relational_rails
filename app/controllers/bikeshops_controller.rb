class BikeshopsController < ApplicationController
  def index
    @bikeshops = Bikeshop.all
  end

  def show
    @bikeshop = Bikeshop.find(params[:id])
  end

  def new
  end

  def create
    bikeshop = Bikeshop.new({
      name: params[:bikeshop][:name],
      employees: params[:bikeshop][:employees].to_i,
      rewards_program: params[:bikeshop][:rewards_program]
    })
    bikeshop.save
    redirect_to "/bikeshops"
  end

  def edit
    @bikeshop = Bikeshop.find(params[:id])
  end

  def update
    bikeshop = Bikeshop.find(params[:id])
    bikeshop.update({
      name: params[:bikeshop][:name],
      employees: params[:bikeshop][:employees].to_i,
      rewards_program: params[:bikeshop][:rewards_program]
    })
    bikeshop.save
    redirect_to "/bikeshops/#{bikeshop.id}"
  end

  def destroy
    bikeshop = Bikeshop.find(params[:id])
    bikeshop.servicerequests.destroy_all
    bikeshop.destroy
    redirect_to "/bikeshops"
  end
end