class ReviewsController < ApplicationController
  before_action :authenticate_user!
  def index
  end

  def new
    @site = Site.find(params[:site_id])
    @review = Review.new
  end

  def create
    @site = Site.find(params[:site_id])
    @review = Review.new(review_params)
    @review.site = @site
    if @review.save
      redirect_to site_path(@review.site_id),
      notice: "Review Saved Successfully"
    else
      render "new"
    end
  end

  private

  def review_params
    params.require(:review).permit(:comment, :rating)
  end
end
