class SitesController < ApplicationController
  def index
    @sites = Site.order('cost_rating DESC')
  end

  def show
    @site = Site.find(params[:id])
  end

  def new
    @site = Site.new
  end

  def create
    @site = Site.new(site_params)

    if @site.save
      redirect_to @site
    else
      render 'new'
    end
  end

  def destroy
    @site = Site.find(params[:id])
    @site.destroy

    redirect_to sites_path
  end

  private
    def site_params
      params.require(:site).permit(:name, :address, :city, :state, :zip, :description, :days_open, :open_time, :close_time, :cost_rating)
    end
end
