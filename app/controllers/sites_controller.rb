class SitesController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  def index
    if params[:query]
      @sites = Site.search(params[:query])
    else
      @sites = Site.all 
    end
    @sites = @sites.order("name DESC").page params[:page]
  end

  def show
    @site = Site.find(params[:id])
    @reviews = @site.reviews.order("score DESC").page params[:page]
    @vote = Vote.new
  end

  def new
    @site = Site.new
  end

  def edit
    @site = Site.find(params[:id])
  end

  def update
    @site = Site.find(params[:id])

    if @site.update_attributes(site_params)

      flash[:notice] = "Site updated successfully"
      redirect_to site_path(@site)
    else
      render "edit"
    end
  end

  def create
    @site = Site.new(site_params)

    if @site.save

      flash[:notice] = "Site created successfully"
      redirect_to site_path(@site)
    else
      render "new"
    end
  end

  def destroy
    @site = Site.find(params[:id])
    @site.destroy

    redirect_to sites_path
  end

  private

  def site_params
    params.require(:site).permit(
      :name,
      :address,
      :city,
      :state,
      :zip,
      :url,
      :description,
      :phone,
      :cost_rating,
      :user_id,
      :page,
      :query
    )
  end
end
